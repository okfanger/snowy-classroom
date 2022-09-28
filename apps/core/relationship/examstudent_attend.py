from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class ExamStudentAttend(FactSchema):
    score = models.FloatField(verbose_name="总分")

    exam = models.ForeignKey(to="Exam",verbose_name="考试号", to_field='id', on_delete=models.CASCADE)
    course = models.ForeignKey(to="Course",verbose_name="课程号" ,to_field="id", on_delete=models.CASCADE)
    student = models.ForeignKey(to="Student",verbose_name="考生学生号", to_field="id", on_delete=models.CASCADE)


class ExamStudentAttendSerializer(serializers.ModelSerializer):
    class Meta:
        model = ExamStudentAttend
        fields = '__all__'
