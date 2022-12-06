from rest_framework.views import APIView
from rest_framework.request import Request

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.innermail import InnerMail
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsTeacher
from apps.users.models import User


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


class CheckNotice(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def get(self, request: Request):
        teacher = User.objects.get(id=request.user.pk)
        notice = InnerMail.objects.filter(from_user=teacher.id)
        notice = notice.values('title', 'content', 'send_date').distinct()
        msg_set = []
        for i in notice:
            msg_set.append({
                'title': i.get('title'),
                'content': i.get('content'),
                'send_date': i.get('send_date').__format__('%Y-%m-%d %H:%M')
            })
        print(msg_set)
        return SuccessResponse(data=msg_set)
