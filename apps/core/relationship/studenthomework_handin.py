from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class StudentHomeworkHandIn(FactSchema):
    submit_time = models.DateTimeField(verbose_name="提交时间")
    submit_detail = models.TextField(verbose_name="提交详情")

    student = models.ForeignKey(to="Student", verbose_name="学生", on_delete=models.CASCADE)
    homework = models.ForeignKey(to='Homework', verbose_name='作业', on_delete=models.CASCADE)
    course = models.ForeignKey(to='Course', verbose_name="课程", on_delete=models.CASCADE)


class StudentHomeworkHandInSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudentHomeworkHandIn
        fields = '__all__'
