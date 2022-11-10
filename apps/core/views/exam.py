from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.exam import ExamSerializer
from apps.users.myJWTAuthentication import MyJWTAuthentication


class ExamByCourseView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]
    def get(self,request: Request):
        course_id = request.query_params['course_id']
        exams = Course.objects.get(pk=course_id).exam_set
        return SuccessResponse(ExamSerializer(exams, many=True).data)
