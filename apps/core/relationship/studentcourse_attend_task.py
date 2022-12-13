from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class CourseAttendTask(FactSchema):
    # 持续的时间
    duration = models.IntegerField(verbose_name="持续时间(单位分钟)", null=False)
    status = models.IntegerField(verbose_name="考勤状态", null=False, default=1)
    course = models.ForeignKey(to="Course",verbose_name="课程", on_delete=models.CASCADE)


class CourseAttendTaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = CourseAttendTask
        fields = '__all__'
