from rest_framework.views import APIView
from rest_framework.request import Request

from apps.bases.response import SuccessResponse
from apps.core.entity.classroom import ClassRoom
from apps.core.entity.innermail import InnerMail
from apps.core.entity.student import Student
from apps.core.entity.teacher import Teacher
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsTeacher
from apps.users.models import User
from datetime import datetime


# 老师发布通知
class PublishNotice(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    # 获取老师所带课程
    def get(self, request: Request):
        teacher_id = Teacher.objects.get(user_id=request.user).id
        classroom_id = ClassRoom.objects.filter(adviser_id=teacher_id)
        print(classroom_id)
        msg_set = []
        for i in classroom_id:
            classroom_name = ClassRoom.objects.get(id=i.id).name
            msg_set.append(classroom_name)
        print(msg_set)
        return SuccessResponse(data=msg_set)

    # 发布公告
    def post(self, request: Request):
        content = request.data['content']
        title = request.data['title']
        send_date = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        receive_date = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        from_user = User.objects.get(id=request.user.pk)
        classroom = ClassRoom.objects.get(name=request.data['classroom'])
        students = Student.objects.filter(classroom=classroom)
        print(students)
        for j in students:
            stu_user_id = User.objects.get(id=j.user.id)
            InnerMail.objects.create(title=title, content=content, send_date=send_date,
                                     receive_date=receive_date,
                                     from_user=from_user, to_user=stu_user_id, is_read=False).save()
        return SuccessResponse(data="发送成功")


# 老师查看公告/搜索公告
class CheckNotice(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def get(self, request: Request):
        teacher = User.objects.get(id=request.user.pk)
        search_msg = request.query_params['search_msg']
        search_time = request.query_params['search_time']
        if len(search_msg) != 0 and search_time != 'Invalid date':
            notice = InnerMail.objects.filter(from_user=teacher.id, title__contains=search_msg,
                                              receive_date__contains=search_time)
        elif len(search_msg) != 0:
            notice = InnerMail.objects.filter(from_user=teacher.id, title__contains=search_msg)
        elif search_time != 'Invalid date':
            notice = InnerMail.objects.filter(from_user=teacher.id, receive_date__contains=search_time)
        else:
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
