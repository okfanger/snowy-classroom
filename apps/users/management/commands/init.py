import datetime
import logging
import os.path

from django.utils import timezone
from tqdm import tqdm
from django.core.management.base import BaseCommand
import pandas as pd
import os
from apps.core.entity.classroom import ClassRoom
from apps.core.entity.course import Course
from apps.core.entity.exam import Exam
from apps.core.entity.question import Question
from apps.core.entity.questionoption import QuestionOption
from apps.core.entity.student import Student
from apps.core.entity.teacher import Teacher
from apps.users import models
from apps.users.models import User

from back.settings import BASE_DIR

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    """
    项目初始化命令: python manage.py init
    """

    def add_arguments(self, parser):
        parser.add_argument('init_name', nargs='*', type=str, )

    @staticmethod
    def init_default():

        DATA_PATH = os.path.join(BASE_DIR, "data")

        # 读取数据
        students_df = pd.read_csv(os.path.join(DATA_PATH, "table_student.csv"))
        teachers_df = pd.read_csv(os.path.join(DATA_PATH, "table_teacher.csv"))
        courses_df = pd.read_csv(os.path.join(DATA_PATH, "table_course.csv"))
        classrooms_df = pd.read_csv(os.path.join(DATA_PATH, "table_classroom.csv"))
        studentCourse_df = pd.read_csv(os.path.join(DATA_PATH, "table_student_course.csv"))
        teacherCourse_df = pd.read_csv(os.path.join(DATA_PATH, "table_teacher_course.csv"))
        exam_df = pd.read_csv(os.path.join(DATA_PATH, "table_exam.csv"))
        # 生成角色
        admin_role = models.Role.objects.create(**{
            'name': 'admin',
            'describe': '管理员'
        })
        teacher_role = models.Role.objects.create(**{
            'name': 'teacher',
            'describe': '教师'
        })
        student_role = models.Role.objects.create(**{
            'name': 'student',
            'describe': '学生'
        })

        # 生成用户
        for row in teachers_df.itertuples():
            user_create = models.User.objects.create(**{
                'id': getattr(row, "id"),
                'name': getattr(row, "姓名"),
                'username': getattr(row, "登录用用户名"),
                'password': getattr(row, "密码"),
                'telephone': getattr(row, "联系电话"),
                'email': getattr(row, "邮箱"),
                'type': 2,
                'role': teacher_role
            })
            user_create.save()

            teacher_create = Teacher.objects.create(**{
                "teach_age": getattr(row, "教龄"),
                "rank": getattr(row, "职称"),
                "desc": getattr(row, "简介"),
                "user": user_create
            }).save()

        # 生成 管理员
        User.objects.create(**{
            'id': 666,
            'name': "张丽",
            'username': "admin",
            'password': "827ccb0eea8a706c4c34a16891f84e7b",
            'telephone': "100010",
            'email': "lili1@qq.com",
            'type': 3,
            'role': admin_role
        })

        # 生成班级
        for row in classrooms_df.itertuples():
            ClassRoom.objects.create(**{
                "id": getattr(row, "id"),
                "name": getattr(row, "班级名"),
                "adviser": User.objects.get(pk=int(getattr(row, "班主任教师id"))).teacher_binder
            }).save()

        for row in students_df.itertuples():
            user_create = User.objects.create(**{
                'id': getattr(row, "id"),
                'name': getattr(row, "姓名"),
                'username': getattr(row, "登录用用户名"),
                'password': getattr(row, "密码"),
                'telephone': getattr(row, "联系电话"),
                'email': getattr(row, "邮箱"),
                'type': 1,
                "role": student_role
            })
            user_create.save()
            student_create = Student.objects.create(**{
                "grade": getattr(row, "年级"),
                # "attend_date": getattr(row, "入学日期"),
                "attend_date": timezone.now(),
                "user": user_create,
                "classroom_id": int(getattr(row, "班级id"))
            })
            student_create.save()

        # 生成课程
        for row in courses_df.itertuples():
            Course.objects.create(**{
                "id": getattr(row, "id"),
                "name": getattr(row, "课程名"),
                # "open_time": getattr(row, "开设时间"),
                "open_time": timezone.now(),
                "completed": True if getattr(row, "完成情况") is True else False,
            }).save()

        for row in studentCourse_df.itertuples():
            course_id = getattr(row, "课程id")
            course_obj = Course.objects.get(pk=int(course_id))
            student_id = getattr(row, "选课学生id")
            course_obj.student_set.add(User.objects.get(pk=int(student_id)).student_binder)

        for row in teacherCourse_df.itertuples():
            course_id = getattr(row, "课程id")
            course_obj = Course.objects.get(pk=int(course_id))
            teacher_id = getattr(row, "教师id")
            course_obj.teacher_set.add(User.objects.get(pk=int(teacher_id)).teacher_binder)

        # 生成 路由表
        from data.default_routes import default_routes
        from data.admin_routes import admin_role_routes
        from data.student_routes import student_role_routes
        from data.teacher_routes import teacher_role_routes

        for item in tqdm([*default_routes, *admin_role_routes, *student_role_routes, *teacher_role_routes]):
            meta = models.MenuRouterMeta.objects.create(**item['meta'])
            meta.save()
            item['meta'] = meta
            models.MenuRouter.objects.create(**item).save()

        # 赋予各个角色的路由
        student_role.menu_routes.set([_["id"] for _ in [*student_role_routes, *default_routes]])
        teacher_role.menu_routes.set([_["id"] for _ in [*teacher_role_routes, *default_routes]])
        admin_role.menu_routes.set([_["id"] for _ in [*admin_role_routes, *default_routes]])

        # 生成 考试信息
        for row in exam_df.itertuples():
            Exam.objects.create(**{
                "id": getattr(row, "id"),
                "name": getattr(row, "name"),
                "type": getattr(row, "type"),
                "start_time": timezone.now(),
                "end_time": timezone.now(),
                "course": Course.objects.get(pk=getattr(row, "course_id"))
            })

        Command.exam_gen()
    @staticmethod
    def exam_gen():
        workspace = os.path.join(BASE_DIR, "data", "exam")
        base_dir = os.listdir(workspace)
        from_count = 100
        current_course = Course.objects.get(name="软件工程概论")
        for xls in base_dir:
            each_exam = Exam.objects.create(**{
                "id": from_count,
                "name": xls.replace("_题目+答案.xlsx", ""),
                "type": "线上" if from_count % 2 == 0 else "线下",
                "start_time": timezone.now(),
                "end_time": timezone.now() + datetime.timedelta(hours=10),
                "course": current_course
            })
            each_exam.save()
            df = pd.read_excel(os.path.join(workspace, xls), sheet_name=0)
            df = df[df["题型"] == "单选题"]
            for row in df.itertuples():
                title = getattr(row, "题目")
                ops = [ getattr(row, f"选项{_}").strip() for _ in range(1,5+1) if not pd.isnull(getattr(row, f"选项{_}")) ]
                right_answer = getattr(row, "正确答案")
                each_ques = Question.objects.create(**{
                    "type": getattr(row, "题型"),
                    "title": title,
                    "content": title,
                    "exam": each_exam
                })
                each_ques.save()
                for idx, op in enumerate(ops):
                    QuestionOption.objects.create(**{
                        "content": op,
                        "right": right_answer == chr(idx + ord('A')),
                        "exam": each_exam,
                        "question": each_ques,
                    }).save()
            from_count += 1


    def handle(self, *args, **options):
        init_name_list = options['init_name']
        if "default" in init_name_list:
            self.init_default()
        if "exam" in init_name_list:
            self.exam_gen()