from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class QuestionResult(FactSchema):
    question = models.ForeignKey("Question", to_field='id', on_delete=models.CASCADE, verbose_name='问题')
    choice = models.IntegerField(verbose_name='选择选项ID')
    right_answer = models.IntegerField(verbose_name="正确选项ID")

class QuestionResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionResult
        fields = '__all__'
