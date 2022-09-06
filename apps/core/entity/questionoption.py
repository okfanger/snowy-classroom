from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class QuestionOption(FactSchema):
    question = models.ForeignKey("Question", to_field='id', on_delete=models.PROTECT, verbose_name='问题')


class QuestionOptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionOption
        fields = '__all__'
