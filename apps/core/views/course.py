from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.pagination import MyPageNumberPagination
from apps.bases.response import SuccessResponse, ErrorResponse
from apps.core.entity.course import Course, CourseSerializer, CourseHasTeacherSerializer
from apps.core.entity.student import Student, StudentSerializer
from apps.core.entity.teacher import Teacher
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsStudent


class CourseFindAllView(APIView):
    """
        显示当前所在用户所有的课程信息
    """
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        global courses
        type = request.user.type
        if type == 1:
            student_binder: Student = request.user.student_binder
            courses = student_binder.courses
        elif type == 2:
            teacher_binder: Teacher = request.user.teacher_binder
            courses = teacher_binder.courses
        else:
            return ErrorResponse(msg="暂不支持")

        courses_ser = CourseHasTeacherSerializer(courses, many=True)
        return SuccessResponse(data={
            "result": courses_ser.data
        })


class CourseFindOneView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        id = request.query_params['id']
        return SuccessResponse(data=CourseHasTeacherSerializer(Course.objects.get(pk=id)).data)

class CourseGetStudentsView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        id = request.query_params['id']
        student_set = Course.objects.get(pk=id).student_set
        return SuccessResponse(data=StudentSerializer(student_set, many=True).data)