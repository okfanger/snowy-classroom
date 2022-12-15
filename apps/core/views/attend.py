from datetime import timedelta

from django.db import transaction
from django.utils import timezone
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
        attendTask = CourseAttendTask.objects.filter(course=course_id, expire_time__gt=timezone.now())
        ret = not attendTask.exists()
        return SuccessResponse(data={
            "attend_able": ret,
            "expire_time":  attendTask[0].expire_time if attendTask.exists() else None,
            'task': CourseAttendTaskFullSerializer(attendTask.first()).data if attendTask.exists() else None
        })


class CourseAttendCreateView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    @transaction.atomic
    def post(self, request: Request):
        teacher: Teacher = request.user.teacher_binder

        courseId = request.data['courseId']
        duration = request.data['duration']

        # 查看当前是否有未结束的考勤任务
        attendTask = CourseAttendTask.objects.filter(course=courseId, expire_time__gt=timezone.now())
        if attendTask.exists():
            return ErrorResponse(msg='当前课程有未结束的考勤任务')

        current_Course = Course.objects.get(pk=courseId)
        course_attend_task = CourseAttendTask.objects.create(**{
            'course': current_Course,
            'duration': duration,
            'expire_time': timezone.now() + timedelta(minutes=duration)
        })

        course_attend_task.save()

        students = current_Course.student_set.all()

        for stu in students:
            StudentCourseAttend.objects.create(**{
                'task': course_attend_task,
                'student': stu,
                'result': '缺勤'
            }).save()

        return SuccessResponse(data=CourseAttendTaskFullSerializer(course_attend_task).data)


class CourseAttendRecordView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        course_id = request.query_params['courseId']
        records = CourseAttendTask.objects.filter(course=course_id, expire_time__lt=timezone.now()).order_by("-create_time")
        return SuccessResponse(data=CourseAttendTaskFullSerializer(records, many=True).data)

class CourseAttendRecordOneView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request: Request):
        task_id = request.query_params['taskId']
        record = CourseAttendTask.objects.get(pk=task_id)
        return SuccessResponse(data=CourseAttendTaskFullSerializer(record).data)


class CourseAttendUpdateBatchView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    @transaction.atomic
    def post(self, request: Request):

        data_list = request.data['dataList']
        print(data_list)
        for item in data_list:
            student = item['student']
            task = item['task']
            result = item['result']
            id = item['id']

            StudentCourseAttend.objects.filter(pk=id).update(**{
                'result': result
            })
        return SuccessResponse("success")
class CourseAttendSignInView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def post(self, request: Request):
        student = request.user.student_binder
        student_course_attend = StudentCourseAttend.objects.filter(student=student, task__id=request.data['taskId'])
        if not student_course_attend.exists():
            return ErrorResponse(msg='考勤记录不存在')
        student_course_attend = student_course_attend.first()
        if student_course_attend.sign_in_time is not None:
            return SuccessResponse(data="success", msg='您已签过到')
        if student_course_attend.task.expire_time < timezone.now():
            return ErrorResponse(msg='考勤已结束')

        student_course_attend.sign_in_time = timezone.now()
        student_course_attend.result = '正常'
        student_course_attend.save()

        return SuccessResponse("success")
