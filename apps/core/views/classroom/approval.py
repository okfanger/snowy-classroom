from rest_framework.views import APIView

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.users.models import User
from apps.core.entity.student import Student
from apps.core.relationship.studentcourse_leave import StudentCourseLeave
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsTeacher
from rest_framework.request import Request


# 教师批改假条
class TeacherApproval(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    # 教师获取自己所带课程的所有假条
    def get(self, request: Request):
        # 根据当前登录用户获得其所教的课程
        courses = request.user.teacher_binder.courses.all()
        # courses = Teacher.objects.get(user_id=request.user).courses.all()
        msg_set = []
        # 遍历课程
        for i in courses:
            # 根据课程id获取对应的假条(返回的是一个集合)
            stu_leave = StudentCourseLeave.objects.filter(course_id=i.id)
            if stu_leave.__len__() > 0:
                # 如果对应课程有假条，则进行下面的操作。
                for j in range(0, len(stu_leave)):
                    # 获取对应假条中的学生id
                    stu_id = stu_leave.values()[j].get('student_id')
                    # 根据学生id找到对应的user_id
                    stu_user = Student.objects.get(id=stu_id).user_id
                    # 根据对应的user_id获取学生的名字
                    user_name = User.objects.get(id=stu_user).name
                    # 根据对应的假条获取课程id
                    courses_id = stu_leave.values()[j].get('course_id')
                    # 根据课程id获取课程名
                    courses_name = Course.objects.get(id=courses_id).name
                    msg_set.append({
                        'id': stu_leave.values()[j].get('id'),
                        'name': user_name,
                        'course': courses_name,
                        'leave_type': stu_leave.values()[j].get('type'),
                        'start_time': str(stu_leave.values()[j].get('start_time').__format__('%Y-%m-%d %H:%M')),
                        'end_time': str(stu_leave.values()[j].get('end_time').__format__('%Y-%m-%d %H:%M')),
                        'reason': stu_leave.values()[j].get('reason'),
                        'status': stu_leave.values()[j].get('status'),
                        'createTime': str(stu_leave.values()[j].get('create_time').__format__('%Y-%m-%d %H:%M')),
                    })
        print(msg_set)
        return SuccessResponse(data=msg_set)

    # 教师批改假条
    def post(self, request: Request):
        leave_id = request.data['leaveId']
        status = request.data['status']
        print(leave_id)
        print(status)
        approval = StudentCourseLeave.objects.get(id=leave_id)
        approval.status = status
        approval.save()
        return SuccessResponse()
