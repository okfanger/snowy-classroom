from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.exam import ExamSerializer, Exam, ExamDetailNoAnswerSerializer
from apps.users.myJWTAuthentication import MyJWTAuthentication


class ExamByCourseView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]
    def get(self,request: Request):
        course_id = request.query_params['id']
        exams = Exam.objects.filter(course_id=course_id)
        return SuccessResponse(ExamSerializer(exams, many=True).data)

class ExamDetailById(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        exam_id = request.query_params['id']
        exam = Exam.objects.get(pk=exam_id)

        return SuccessResponse(ExamDetailNoAnswerSerializer(exam).data)
