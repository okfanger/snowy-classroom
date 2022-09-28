from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class QuestionOption(FactSchema):
    type = models.CharField(verbose_name="题目类型", max_length=10, null=False)
    right = models.BooleanField(verbose_name="是否正确", null=False)
    content = models.CharField(verbose_name="题目内容", max_length=1024)
    
    question = models.ForeignKey("Question", to_field='id', on_delete=models.CASCADE, verbose_name='问题')
    exam = models.ForeignKey("Exam", to_field='id', on_delete=models.CASCADE, verbose_name="试卷")

class QuestionOptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionOption
        fields = '__all__'
