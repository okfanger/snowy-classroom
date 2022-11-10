from rest_framework.views import APIView

from apps.bases.pagination import MyPageNumberPagination
from apps.bases.response import SuccessResponse, ErrorResponse
from apps.core.entity.course import Course, CourseSerializer, CourseHasTeacherSerializer
from apps.core.entity.student import Student
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsStudent


class CourseStudentFindAll(APIView):
    """
        显示当前所在用户所有的课程信息
    """
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def get(self, request):
        # keyword = request.query_params["keyword"]
        student_binder : Student = request.user.student_binder
        # courses = student_binder.courses.filter(name__contains=keyword)
        courses = student_binder.courses
        courses_ser = CourseHasTeacherSerializer(courses, many=True)

        return SuccessResponse(data={
            "result": courses_ser.data
        })