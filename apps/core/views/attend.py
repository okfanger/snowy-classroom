from django.db import transaction
from django.utils.datetime_safe import datetime
from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import ErrorResponse, SuccessResponse
from apps.core.entity.course import Course
from apps.core.entity.teacher import Teacher
from apps.core.relationship.studentcourse_attend import StudentCourseAttend
from apps.core.relationship.studentcourse_attend_task import CourseAttendTask, CourseAttendTaskFullSerializer
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

    @transaction.atomic
    def post(self, request: Request):
        teacher: Teacher = request.user.teacher_binder

        courseId = request.data['courseId']
        duration = request.data['duration']

        # 查看当前是否有未结束的考勤任务
        attendTask = CourseAttendTask.objects.filter(course=courseId, status=1)
        if attendTask.exists():
            return ErrorResponse(msg='当前课程有未结束的考勤任务')

        current_Course = Course.objects.get(pk=courseId)
        course_attend_task = CourseAttendTask.objects.create(**{
            'course': current_Course,
            'duration': duration
        })

        course_attend_task.save()

        students = current_Course.student_set.all()

        for stu in students:
            StudentCourseAttend.objects.create(**{
                'task': course_attend_task,
                'student': stu,
                'result': '未签到'
            }).save()

        return SuccessResponse("success")


class CourseAttendRecordView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        course_id = request.query_params['courseId']
        records = CourseAttendTask.objects.filter(course=course_id, status=0).order_by("-create_time")
        return SuccessResponse(data=CourseAttendTaskFullSerializer(records, many=True).data)


class CourseAttendSignInView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def post(self, request: Request):
        student = request.user.student_binder
        student_course_attend = StudentCourseAttend.objects.get(student=student, task__id=request.data['taskId'])
        student_course_attend.sign_in_time = datetime.now()
        student_course_attend.result = '已签到'
        student_course_attend.save()
