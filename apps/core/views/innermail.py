from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework import serializers
from rest_framework.request import Request
from apps.bases.response import SuccessResponse, ErrorResponse
from apps.core.entity.course import Course
from apps.core.entity.innermail import InnerMail
from apps.core.entity.student import Student
from apps.users.models import User
from apps.users.myJWTAuthentication import MyJWTAuthentication
from datetime import datetime


# 发送邮件
class SendMail(APIView, serializers.ModelSerializer):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    # 发送邮件
    def post(self, request: Request):
        content = request.data['content']
        title = request.data['title']
        send_date = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        receive_date = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        from_user = User.objects.get(id=request.user.pk)
        if from_user.type == 1:
            to_user = User.objects.get(username=request.data['to_user'])

            InnerMail.objects.create(content=content, title=title, send_date=send_date,
                                     receive_date=receive_date,
                                     from_user=from_user, to_user=to_user, is_read=False).save()
            return SuccessResponse(data="发送成功")

        if from_user.type == 2:
            course = Course.objects.get(name=request.data['to_user'])
            students = Student.objects.filter(courses=course)
            for j in students:
                stu_user_id = User.objects.get(id=j.user.id)
                InnerMail.objects.create(title=title, content=content, send_date=send_date,
                                         receive_date=receive_date,
                                         from_user=from_user, to_user=stu_user_id, is_read=False).save()
            return SuccessResponse(data="发送成功")


# 接收邮件(查看邮件)
class ReceiveMail(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        # this_user = request.POST.get('this_user') # 不能把选择权交给用户
        this_user = request.user
        all_mail = InnerMail.objects.filter(to_user=this_user)
        msg_set = []
        for i in all_mail:
            this_mail_id = i.id
            content = i.content
            title = i.title
            receive_date = str(i.receive_date)
            from_user = User.objects.get(id=i.from_user.id).name
            is_read = i.is_read
            msg_set.append({
                "content": content,
                "title": title,
                "receive_date": str(receive_date),
                "is_read": is_read,
                "this_mail_id": this_mail_id,
                "from_user": from_user
            })
        print(msg_set)
        return SuccessResponse(data=msg_set)

    # 消息已读未读
    def post(self, request: Request):
        this_mail_id = InnerMail.objects.get(id=request.data['this_mail_id'])
        this_mail_id.is_read = 1
        this_mail_id.save()
