from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.request import Request

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.homework import Homework, HomeworkSerializer
from apps.core.entity.student import Student
from apps.core.relationship.studenthomework_handin import StudentHomeworkHandIn, StudentHomeworkHandInSerializer
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsTeacher, IsStudent
from datetime import datetime
from apps.users.models import User


# 作业-老师
class TeacherHomework(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    # 老师发布作业
    def post(self, request: Request):
        course_id = Course.objects.get(name=request.data['course'])
        title = request.data['title']
        content = request.data['content']
        start_time = request.data['start_time']
        end_time = request.data['end_time']
        print(course_id, title, content, start_time, end_time)
        Homework.objects.create(title=title, content=content, start_time=start_time, end_time=end_time,
                                course=course_id).save()
        return SuccessResponse()

    # 老师批改作业
    def get(self, request: Request):
        courses = request.user.teacher_binder.courses.all()
        msg_set = []
        for i in courses:
            stu_work_list = StudentHomeworkHandIn.objects.filter(course=i.id)
            if stu_work_list.__len__() > 0:
                # 如果对应课程学生提交作业，则进行下面的操作。
                for j in range(0, len(stu_work_list)):
                    stu_id = stu_work_list.values()[j].get('student_id')
                    stu_user = Student.objects.get(id=stu_id).user_id
                    stu_name = User.objects.get(id=stu_user).name
                    homework_id = stu_work_list.values()[j].get('homework_id')
                    homework_title = Homework.objects.get(id=homework_id).title
                    submit_time = stu_work_list.values()[j].get('submit_time').__format__('%Y-%m-%d %H:%M')
                    submit_detail = stu_work_list.values()[j].get('submit_detail')
                    msg_set.append({
                        'student': stu_name,
                        'homework_id': homework_id,
                        'homework_title': homework_title,
                        'submit_time': submit_time,
                        'submit_detail': submit_detail
                    })
        print(msg_set)
        return SuccessResponse(data=msg_set)


# 作业-学生
class StudentHomework(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    # 学生查看作业
    def get(self, request: Request):
        course_id = request.query_params['course_id']
        homework_id = request.query_params['homework_id']
        if homework_id == '0':
            homework_list = Homework.objects.filter(course_id=course_id)
        else:
            homework_list = Homework.objects.filter(course_id=course_id, id=homework_id)
        msg_set = []
        for i in homework_list:
            msg_set.append({
                'homework_id': i.id,
                'title': i.title,
                'content': i.content,
                'start_time': str(i.start_time.__format__('%Y-%m-%d %H:%M')),
                'end_time': str(i.end_time.__format__('%Y-%m-%d %H:%M'))
            })
        print(msg_set)
        return SuccessResponse(data=msg_set)

    # 学生上交作业
    def post(self, request: Request):
        student = Student.objects.get(user_id=request.user)
        homework = Homework.objects.get(id=request.data['homework_id'])
        course = Course.objects.get(id=request.data['course_id'])
        submit_time = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        submit_detail = request.data['submit_detail']
        print(student, course, submit_time, submit_detail)
        StudentHomeworkHandIn.objects.create(student=student, homework=homework, course=course, submit_time=submit_time,
                                             submit_detail=submit_detail).save()
        return SuccessResponse()
