from rest_framework.views import APIView

from apps.bases.response import SuccessResponse
from apps.core.entity.classroom import ClassRoom
from apps.core.entity.teacher import Teacher
from apps.users.models import User
from apps.core.entity.student import Student
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsTeacher, IsStudent
from rest_framework.request import Request


# 设立班委
class PickMonitor(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    # 返回班级中所有学生
    def get(self, request: Request):
        teacher_id = Teacher.objects.get(user_id=request.user).pk
        classroom = ClassRoom.objects.get(adviser_id=teacher_id)
        monitor = classroom.monitor
        msg_set = []
        search_msg = request.query_params['search_msg']
        print(search_msg)
        students = Student.objects.filter(classroom_id=classroom)
        for i in students:
            if len(search_msg) == 0:
                stu_user = User.objects.filter(id=i.user.id)
            else:
                stu_user = User.objects.filter(id=i.user.id, name__contains=search_msg)
            for j in stu_user:
                msg_set.append({
                    'id': i.id,
                    'name': j.name,
                    'username': j.username,
                    'email': j.email,
                    'telephone': j.telephone
                })

        return SuccessResponse(data=(msg_set, monitor))

    # 设立班委
    def post(self, request: Request):
        student = request.data['stu_id']
        teacher_id = Teacher.objects.get(user_id=request.user).pk
        classroom = ClassRoom.objects.get(adviser_id=teacher_id)
        classroom.monitor = student
        classroom.save()
        return SuccessResponse()


# 学生查看班委
class CheckMonitor(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def get(self, request: Request):
        monitor_id = ClassRoom.objects.values()[0].get('monitor')
        monitor = User.objects.filter(id=Student.objects.get(id=monitor_id).user_id)
        print(monitor)
        msg_set = []
        for i in monitor:
            msg_set.append({
                'name': i.name,
                'username': i.username,
                'email': i.email,
                'telephone': i.telephone
            })
        print(msg_set)
        return SuccessResponse(data=msg_set)
