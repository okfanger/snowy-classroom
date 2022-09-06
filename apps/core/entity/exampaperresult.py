from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class ExamPaperResult(FactSchema):
    exam_paper = models.OneToOneField("ExamPaper", to_field='id', on_delete=models.CASCADE)


class ExamPaperResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = ExamPaperResult
        fields = '__all__'
