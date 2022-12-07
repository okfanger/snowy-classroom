from rest_framework.views import APIView
from rest_framework.request import Request

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.innermail import InnerMail
from apps.core.entity.student import Student
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
        courses = request.user.teacher_binder.courses.all()
        msg_set = []
        for i in courses:
            courses_name = Course.objects.get(id=i.id).name
            msg_set.append(courses_name)
        print(msg_set)
        return SuccessResponse(data=msg_set)

    # 发布公告
    def post(self, request: Request):
        content = request.data['content']
        title = request.data['title']
        send_date = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        receive_date = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M')
        from_user = User.objects.get(id=request.user.pk)
        course = Course.objects.get(name=request.data['course'])
        students = Student.objects.filter(courses=course)
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
        # 如果没有搜索信息则返回全部数据
        if len(search_msg) == 0:
            notice = InnerMail.objects.filter(from_user=teacher.id)
        # 否则返回查到的数据
        else:
            notice = InnerMail.objects.filter(from_user=teacher.id, title__contains=search_msg)

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
