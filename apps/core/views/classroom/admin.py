from rest_framework.views import APIView

from apps.bases.response import SuccessResponse, ErrorResponse
from apps.core.entity.classroom import ClassRoom
from apps.core.entity.course import Course
from apps.core.entity.innermail import InnerMail
from apps.users.models import User
from apps.core.entity.student import Student
from apps.core.relationship.studentcourse_leave import StudentCourseLeave
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsAdmin
from rest_framework.request import Request


# 查看假条
class CheckLeaveAdmin(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAdmin]

    def get(self, request: Request):
        leave_list = StudentCourseLeave.objects.values()
        msg_set = []
        for i in leave_list:
            stu_id = Student.objects.get(id=i.get('student_id')).user_id
            stu_name = User.objects.get(id=stu_id).name
            course_name = Course.objects.get(id=i.get('course_id')).name
            msg_set.append({
                'id': i.get('id'),
                'name': stu_name,
                'course': course_name,
                'leave_type': i.get('leave_type'),
                'start_time': str(i.get('start_time').__format__('%Y-%m-%d %H:%M')),
                'end_time': str(i.get('end_time').__format__('%Y-%m-%d %H:%M')),
                'reason': i.get('reason'),
                'status': i.get('status'),
                'createTime': str(i.get('create_time').__format__('%Y-%m-%d %H:%M'))
            })
        return SuccessResponse(data=msg_set)


# 管理员查看班委
class CheckMonitorAdmin(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAdmin]

    def get(self, request: Request):
        monitor_id = ClassRoom.objects.values()[0].get('monitor')
        if monitor_id is None or monitor_id == 0:
            return ErrorResponse(msg='还未选择班委')
        else:
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


# 管理员查看通知
class CheckNoticeAdmin(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAdmin]

    def get(self, request: Request):
        teacher_notice = InnerMail.objects.values('title', 'content', 'send_date', 'from_user').distinct()
        msg_set = []
        for i in teacher_notice:
            msg_set.append({
                'title': i.get('title'),
                'content': i.get('content'),
                'from_user': User.objects.get(id=i.get('from_user')).name,
                'send_date': i.get('send_date').__format__('%Y-%m-%d %H:%M')
            })
        print(msg_set)
        return SuccessResponse(data=msg_set)
