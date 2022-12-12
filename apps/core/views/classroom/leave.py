from rest_framework.views import APIView

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.student import Student
from apps.core.relationship.studentcourse_leave import StudentCourseLeave
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsStudent
from rest_framework.request import Request


# 学生请假
class StudentLeave(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    # 学生请假
    def post(self, request: Request):
        student_id = Student.objects.get(user=request.user.id)
        course_id = Course.objects.get(name=request.data['course'])
        leave_type = request.data['leave_type']
        reason = request.data['reason']
        start_time = request.data['start_time']
        end_time = request.data['end_time']
        print(student_id, course_id, leave_type, reason, start_time, end_time)
        StudentCourseLeave.objects.create(reason=reason, type=leave_type, start_time=start_time, end_time=end_time
                                          , student=student_id, course=course_id)
        return SuccessResponse(data="请假成功")

    # 返回所有课程
    def get(self, request: Request):
        all_course = []
        for i in Course.objects.values_list('name'):
            all_course.append(''.join(i))
        print(all_course)
        return SuccessResponse(data=all_course)


# 学生查看假条
class CheckLeaveStudent(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def get(self, request: Request):
        student = Student.objects.get(user_id=request.user).pk
        search_time = request.query_params['search_time']
        print(search_time)
        msg_set = []
        if search_time == 'Invalid date':
            stu_leave = StudentCourseLeave.objects.filter(student_id=student)
            print("1")
            print(stu_leave)
        else:
            stu_leave = StudentCourseLeave.objects.filter(student_id=student, create_time__contains=search_time)
            print("2")
            print(stu_leave)
        for i in stu_leave:
            msg_set.append({
                'course': Course.objects.get(id=i.course.id).name,
                'leave_type': i.type,
                'start_time': str(i.start_time.__format__('%Y-%m-%d %H:%M')),
                'end_time': str(i.end_time.__format__('%Y-%m-%d %H:%M')),
                'reason': i.reason,
                'status': i.status,
                'createTime': str(i.create_time.__format__('%Y-%m-%d %H:%M'))
            })
        return SuccessResponse(data=msg_set)
