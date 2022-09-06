from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class Course(FactSchema):
    name = models.CharField(verbose_name='课程名')


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'
