from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema
from apps.core.entity.questionoption import QuestionOptionSerializer


class ExamPaper(FactSchema):
    name = models.CharField(verbose_name='试卷名', max_length=256)
    course = models.ForeignKey("Course", to_field='id', on_delete=models.PROTECT, verbose_name='课程')
    start_time = models.DateTimeField(verbose_name='开始时间')
    end_time = models.DateTimeField(verbose_name='截止时间')
    questions = models.ManyToManyField(to="Question", verbose_name='题目集')


class ExamPaperSerializer(serializers.ModelSerializer):

    questions = QuestionOptionSerializer(many=True)

    class Meta:
        model = ExamPaper
        fields = '__all__'
