from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class ExamQuestionResult(FactSchema):
    stu_answer = models.IntegerField(verbose_name='选择选项ID', null=True)
    right_answer = models.IntegerField(verbose_name="正确选项ID", null=True)

    right = models.BooleanField(verbose_name="是否正确", null=True)
    score = models.IntegerField(verbose_name="拿到的分值", null=True)

    exam_join = models.ForeignKey(to="ExamStudentAttend", on_delete=models.CASCADE, verbose_name="考试记录")
    question = models.ForeignKey("Question", to_field='id', on_delete=models.CASCADE, verbose_name='问题')


class ExamQuestionResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = ExamQuestionResult
        fields = '__all__'
