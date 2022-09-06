from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class ExamResult(FactSchema):
    exam = models.OneToOneField("ExamPaper", to_field='id', on_delete=models.CASCADE)
    student_amount = models.IntegerField(verbose_name="参与人数")
    ave = models.DecimalField(verbose_name="平均分")
    pass_amount = models.IntegerField(verbose_name="及格人数")


class ExamResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = ExamResult
        fields = '__all__'
