from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import SuccessResponse, ErrorResponse
from apps.core.entity.exam import ExamSerializer, Exam, ExamDetailNoAnswerSerializer
from apps.core.entity.student import Student
from apps.core.relationship.examquestion_result import ExamQuestionResult
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
        student_id = request.user.student_binder.pk
        exam_attend_id = request.data["examAttendId"]
        question_id = request.data["questionId"]
        stu_answer = request.data["answer"]

        exam_attend_record = ExamStudentAttend.objects.get(pk=exam_attend_id, student__id=student_id)

        if exam_attend_record.is_done: return ErrorResponse(msg="非法操作")

        per_question_record, is_created = ExamQuestionResult.objects.get_or_create(
            exam_join=exam_attend_record,
            question_id=question_id
        )
        per_question_record.stu_answer = stu_answer
        per_question_record.save()
        return SuccessResponse(data="success")


class ExamStudentStateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def get(self, request: Request):
        student_binder: Student = request.user.student_binder
        exam_id = request.query_params["exam_id"]
        is_exam_exist = Exam.objects.filter(pk=exam_id).exists()
        if not is_exam_exist:
            return SuccessResponse({
                "code": 404,
            })  # 考试不存在

        attend = ExamStudentAttend.objects.filter(exam_id=exam_id, student_id=student_binder.id)
        ans = attend.exists()
        if not ans:
            return SuccessResponse({
                "code": 202,
            })  # 没参加
        else:
            if attend[0].is_done:
                return SuccessResponse({
                    "code": 203,
                    "attend_id": attend[0].pk,
                    "is_done": attend[0].is_done
                })  # 已参加并且已经交卷

            else:
                return SuccessResponse({
                    "code": 201,
                    "attend_id": attend[0].pk,
                    "is_done": attend[0].is_done
                })  # 已参加


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
                "last_attend": False,
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

class ExamOverView(APIView):

    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]
    def post(self, request: Request):
        student_id = request.user.student_binder.pk
        exam_attend_id = request.data["examAttendId"]
        exam_attend_record = ExamStudentAttend.objects.get(pk=exam_attend_id, student__id=student_id)
        exam_attend_record.is_done = True
        exam_attend_record.save()
        return SuccessResponse(data="success")