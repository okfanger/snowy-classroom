import logging
import os.path

from django.utils import timezone
from tqdm import tqdm
from django.core.management.base import BaseCommand

from apps.core.entity.classroom import ClassRoom
from apps.core.entity.course import Course
from apps.core.entity.student import Student
from apps.core.entity.teacher import Teacher
from apps.users import models
from apps.users.models import User

import pandas as pd
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
        from data.routes import default_routes

        for item in tqdm(default_routes):
            meta = models.MenuRouterMeta.objects.create(**item['meta'])
            meta.save()
            item['meta'] = meta
            models.MenuRouter.objects.create(**item).save()

    def handle(self, *args, **options):
        init_name_list = options['init_name']
        if "default" in init_name_list:
            self.init_default()
