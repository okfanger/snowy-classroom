from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema

# 考勤
class StudentCourseAttend(FactSchema):
    sign_in_time = models.DateTimeField(verbose_name="签到时间")
    sign_in_place = models.CharField(verbose_name="签到地点", max_length=256)
    result = models.CharField(verbose_name="出勤结果", max_length=256)

    student = models.ForeignKey(to="Student",verbose_name="学生", on_delete=models.CASCADE)
    course = models.ForeignKey(to="Course",verbose_name="课程", on_delete=models.CASCADE)




class StudentCourseAttendSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudentCourseAttend
        fields = '__all__'