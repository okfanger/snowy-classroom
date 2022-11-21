from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.exam import ExamSerializer, Exam, ExamDetailNoAnswerSerializer
from apps.core.relationship.examstudent_attend import ExamStudentAttend
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsStudent


class ExamByCourseView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
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


class ExamLiveSubmitView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def post(self, request: Request):
        student_id = request.data["student_id"]
        exam_id = request.data["exam_id"]
        exam_attend_record = ExamStudentAttend.objects.get(exam__id=exam_id, student__id=student_id)
        # exam_attend_record.
        pass
