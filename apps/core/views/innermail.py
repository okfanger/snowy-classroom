from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework import serializers
from rest_framework.request import Request
from apps.bases.response import SuccessResponse
from apps.core.entity.innermail import InnerMail
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
        to_user = User.objects.get(username=request.data['to_user'])

        InnerMail.objects.create(content=content, title=title, send_date=send_date,
                                 receive_date=receive_date,
                                 from_user=from_user, to_user=to_user, is_read=False).save()
        return SuccessResponse(data="发送成功")


# 接收邮件(查看邮件)
class ReceiveMail(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    # 查看邮件/搜索邮件
    def get(self, request: Request):
        this_user = request.user
        search_msg = request.query_params['search_msg']
        msg_set = []
        # 如果搜索的值为空，则全部返回
        if len(search_msg) == 0:
            all_mail = InnerMail.objects.filter(to_user=this_user)
        # 否则返回指定搜索的数据
        else:
            all_mail = InnerMail.objects.filter(to_user=this_user, title__contains=search_msg)

        for i in all_mail:
            this_mail_id = i.id
            content = i.content
            title = i.title
            receive_date = i.receive_date.__format__('%Y-%m-%d %H:%M')
            from_user = User.objects.get(id=i.from_user.id).name
            is_read = i.is_read
            msg_set.append({
                "content": content,
                "title": title,
                "receive_date": receive_date,
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
