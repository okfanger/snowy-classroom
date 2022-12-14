from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema

# 考勤
class StudentCourseAttend(FactSchema):
    student = models.ForeignKey(to="Student", on_delete=models.CASCADE, verbose_name="学生")
    task = models.ForeignKey(to="CourseAttendTask",verbose_name="考勤任务", on_delete=models.CASCADE)
    sign_in_time = models.DateTimeField(verbose_name="签到时间", null=True)
    result = models.CharField(verbose_name="出勤结果", max_length=256)

class StudentCourseAttendSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudentCourseAttend
        fields = '__all__'
