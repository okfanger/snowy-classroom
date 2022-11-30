from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework import serializers
from rest_framework.request import Request
from apps.bases.response import SuccessResponse, ErrorResponse
from apps.core.entity.innermail import InnerMail
from apps.users.models import User
from apps.users.myJWTAuthentication import MyJWTAuthentication


# 发送邮件
class SendMail(APIView,serializers.ModelSerializer):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    # 发送邮件
    def post(self, request: Request):
        from datetime import datetime
        content = request.data['content']
        title = request.data['title']
        send_date = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        receive_date = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        # from_user = request.data['from_user'] #这里不应该交给用户，万一用户选个别的人的号就bug了
        # 从 token中拿：
        # current_user: User = request.user
        # from_user = current_user.pk  # 这样拿
        from_user = User.objects.get(id=request.user.id)
        to_user = User.objects.get(id=request.data['to_user'])
        if title is None or title == '':
            return ErrorResponse(data="标题不能为空")
        elif to_user is None or to_user == '':
            return ErrorResponse(data="收件人不能为空")
        elif content is None or content == '':
            return ErrorResponse(data="内容不能为空")
        else:
            print(title, content, from_user, to_user)
            # 发送邮件(等价于在内邮数据库中加一条数据)
            InnerMail.objects.create(content=content, title=title, send_date=send_date,
                                     receive_date=receive_date,
                                     from_user=from_user, to_user=to_user, is_read=False).save()
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
