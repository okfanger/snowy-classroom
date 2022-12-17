from django.db import transaction
from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import SuccessResponse, ErrorResponse
from apps.core.entity.exam import ExamSerializer, Exam, ExamDetailNoAnswerSerializer
from apps.core.entity.question import Question
from apps.core.entity.questionoption import QuestionOption
from apps.core.entity.student import Student
from apps.core.relationship.examquestion_result import ExamQuestionResult
from apps.core.relationship.examstudent_attend import ExamStudentAttend, ExamStudentAttendSerializer, \
    ExamStudentAttendFullSerializer
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsStudent, IsTeacher


class ExamTeacherCreateOrUpdateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def post(self, request: Request):
        print(request.data)
        serializer = ExamSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return SuccessResponse("success")
        else:
            return ErrorResponse(serializer.errors)
class ExamByCourseView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        course_id = request.query_params['id']
        exams = Exam.objects.filter(course_id=course_id).order_by("-id")
        return SuccessResponse(ExamSerializer(exams, many=True).data)

class ExamRemoveView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def post(self, request: Request):
        exam_id = request.data['id']
        exam = Exam.objects.get(id=exam_id)
        exam.delete()
        return SuccessResponse("success")
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

        for item in exam_attend_record.examquestionresult_set.all():
            options = item.question.options.all()
            stu_answer = item.stu_answer
            if stu_answer == "":
                item.right = False
                item.score = 0
                item.save()
                continue
            is_right = QuestionOption.objects.get(pk=int(stu_answer)).right
            if is_right:
                item.right = True
                item.score = 5
                item.save()
            else:
                item.right = False
                item.score = 0
                item.save()
            if exam_attend_record.score is None:
                exam_attend_record.score = 0
        exam_attend_record.save()


        return SuccessResponse(data="success")

class ExamQuestionRemoveView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def post(self, request: Request):
        question_id = request.data['id']
        question = Question.objects.get(id=question_id)
        question.delete()
        return SuccessResponse("success")


class ExamQuestionOptionRemoveView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def post(self, request: Request):
        option_id = request.data['id']
        option = QuestionOption.objects.get(id=option_id)
        option.delete()
        return SuccessResponse("success")


class ExamQuestionSaveOrUpdateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def post(self, request: Request):
        quesitonId = request.data.get("id", None)
        examId = request.data['examId']
        print(examId)
        title = request.data['title']
        type = request.data['type']

        if quesitonId is None:
            question = Question.objects.create(**{
                "title": title,
                "type": type,
                "exam_id": examId
            })
            question.save()
        else:
            question = Question.objects.get(pk=quesitonId)
            question.title = title
            question.type = type
            question.save()

        return SuccessResponse("success")

class ExamQuestionOptionSaveOrUpdateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def post(self, request: Request):
        quesitonId = request.data['questionId']
        optionId = request.data.get("id", None)
        examId = request.data['examId']
        content = request.data['content']
        right = request.data['right']

        if optionId is None:
            option = QuestionOption.objects.create(**{
                "content": content,
                "right": right,
                "question": quesitonId,
                "exam_id": examId
            })
            option.save()
        else:
            option = QuestionOption.objects.get(pk=optionId)
            option.content = content
            option.right = right
            option.save()
        return SuccessResponse("success")


class ExamSaveOptions(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    @transaction.atomic
    def post(self, request: Request):
        print(request.data['options'])
        exam_id = request.data['examId']
        options = request.data['options']
        for item in options:
            if item['id'] is None:
                option = QuestionOption.objects.create(**{
                    "content": item['content'],
                    "right": item['right'],
                    "question_id": item['questionId'],
                    "exam_id": exam_id
                })
                option.save()
            else:
                option = QuestionOption.objects.get(pk=item['id'])
                option.content = item['content']
                option.right = item['right']
                option.save()
        return SuccessResponse("success")


class StudentResultByExamView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def get(self, request: Request):
        exam_id = request.query_params['examId']
        exam = Exam.objects.get(pk=exam_id)
        exam_attend = ExamStudentAttend.objects.filter(exam_id=exam_id)
        return SuccessResponse(data=ExamStudentAttendSerializer(exam_attend, many=True).data)


class StudentResultOneView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def get(self, request: Request):
        id = request.query_params['id']
        exam_attend = ExamStudentAttend.objects.get(pk=id)
        return SuccessResponse(data=ExamStudentAttendFullSerializer(exam_attend).data)

class ExamQuestionOptionChangeRightView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def post(self, request: Request):
        option_id = request.data['id']
        right = request.data['right']
        option = QuestionOption.objects.get(pk=option_id)
        option.right = right
        option.save()
        return SuccessResponse("success")
