from rest_framework.views import APIView
from rest_framework.request import Request

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsTeacher


# 老师发布通知
class PublishNotice(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    # 获取老师所带课程
    def get(self, request: Request):
        courses = request.user.teacher_binder.courses.all()
        msg_set = []
        for i in courses:
            courses_name = Course.objects.get(id=i.id).name
            msg_set.append(courses_name)
        print(msg_set)
        return SuccessResponse(data=msg_set)
