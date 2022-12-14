from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema
from apps.core.entity.questionoption import QuestionOptionSerializer, QuestionOptionNoAnswerSerializer


class Question(FactSchema):
    type = models.CharField(verbose_name="题目类型", max_length=10, null=False)
    title = models.CharField(verbose_name="题目标题", max_length=256, null=False)
    content = models.CharField(verbose_name="题目内容", max_length=1024, null=False)

    exam = models.ForeignKey(to="Exam", on_delete=models.CASCADE)


class QuestionSerializer(serializers.ModelSerializer):
    options = QuestionOptionSerializer(many=True)
    class Meta:
        model = Question
        fields = '__all__'
class QuestionNoAnswerSerializer(serializers.ModelSerializer):
    options = QuestionOptionNoAnswerSerializer(many=True)
    class Meta:
        model = Question
        fields = '__all__'
