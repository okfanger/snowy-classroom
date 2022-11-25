from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import SuccessResponse
from apps.core.entity.exam import ExamSerializer, Exam, ExamDetailNoAnswerSerializer
from apps.core.entity.student import Student
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


class ExamStudentStateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def get(self, request: Request):
        student_binder: Student = request.user.student_binder
        exam_id = request.query_params["exam_id"]
        is_exam_exist = Exam.objects.filter(pk=exam_id).exists()
        if not is_exam_exist:
            return SuccessResponse(404)  # 考试不存在

        ans = ExamStudentAttend.objects.filter(exam_id=exam_id, student_id=student_binder.id).exists()
        if not ans:
            return SuccessResponse(202)  # 没参加
        else:
            return SuccessResponse(201)  # 已参加


class ExamStudentGenerateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def post(self, request: Request):
        student_binder: Student = request.user.student_binder

        exam_id = request.data['examId']
        current_exam = Exam.objects.get(pk=exam_id)  # select * from exam where id = #{exam_id}

        # 检查之前有没有参加过
        is_attend = ExamStudentAttend.objects.filter(exam_id=exam_id, student_id=student_binder.id).exists()
        if is_attend:
            return SuccessResponse(data={
                "last_attend": False
            })
        else:

            exam_attend_obj = ExamStudentAttend.objects.create(**{
                "score": 0,
                "course": current_exam.course,
                "exam": current_exam,
                "student": student_binder
            })
            exam_attend_obj.save()

            return SuccessResponse(data={
                "last_attend": True,
            })

        pass
