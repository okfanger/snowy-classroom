from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class StudentCourseLeave(FactSchema):
    reason = models.CharField(verbose_name="请假理由", max_length=1024, null=True)
    type = models.CharField(verbose_name="请假类型", max_length=128)
    remark = models.CharField(verbose_name="审批备注", max_length=1024)
    status = models.BooleanField(verbose_name="审批状态")

    start_time = models.DateTimeField(verbose_name="开始时间")
    end_time = models.DateTimeField(verbose_name="结束时间")

    student = models.ForeignKey(to="Student",verbose_name="学生", on_delete=models.CASCADE)
    course = models.ForeignKey(to="Course",verbose_name="课程", on_delete=models.CASCADE)




class StudentCourseLeaveSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudentCourseLeave
        fields = '__all__'
