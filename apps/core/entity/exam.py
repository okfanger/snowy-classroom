from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema
from apps.core.entity.questionoption import QuestionOptionSerializer


class Exam(FactSchema):
    name = models.CharField(verbose_name='考试名', max_length=128)
    type = models.CharField(verbose_name="考试类型", max_length=10)
    start_time = models.DateTimeField(verbose_name='开始时间')
    end_time = models.DateTimeField(verbose_name='截止时间')

    course = models.ForeignKey("Course", to_field='id', on_delete=models.PROTECT, verbose_name='课程')
    # questions = models.ManyToManyField(to="Question", verbose_name='题目集')
    

class ExamSerializer(serializers.ModelSerializer):
    # questions = QuestionOptionSerializer(many=True)

    class Meta:
        model = Exam
        fields = '__all__'

class ExamPlainSerializer(serializers.ModelSerializer):

    class Meta:
        model = Exam
        # excludes = ['questions']
