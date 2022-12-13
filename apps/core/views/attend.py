from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import ErrorResponse, SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.teacher import Teacher
from apps.core.relationship.studentcourse_attend_task import CourseAttendTask
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsStudent, IsTeacher

class CourseAttendBeforeCreateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def post(self, request: Request):
        course_id = request.data['courseId']
        # 查看当前是否有未结束的考勤任务
        attendTask = CourseAttendTask.objects.filter(course=course_id, status=1)
        ret = not attendTask.exists()
        return SuccessResponse(data=ret)


class CourseAttendCreateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def post(self, request: Request):
        teacher: Teacher =request.user.teacher_binder

        courseId = request.data['courseId']
        duration = request.data['duration']

        # 查看当前是否有未结束的考勤任务
        attendTask = CourseAttendTask.objects.filter(course=courseId, status=1)
        if attendTask.exists():
            return ErrorResponse(msg='当前课程有未结束的考勤任务')

        CourseAttendTask.objects.create(**{
            'course': Course.objects.get(pk=courseId),
            'duration': duration
        }).save()

        return SuccessResponse("success")





class CourseAttendSignInView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def post(self, request: Request):
        student_id = request.user.student_binder
        course_id = request.data['course_id']
        attend_id = request.data['attend_id']
