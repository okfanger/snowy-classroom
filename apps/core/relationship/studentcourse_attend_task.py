from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class StudentCourseAttendTask(FactSchema):
    student = models.ForeignKey(to="Student",verbose_name="学生", on_delete=models.CASCADE)
    course = models.ForeignKey(to="Course",verbose_name="课程", on_delete=models.CASCADE)


class StudentCourseAttendTaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = StudentCourseAttendTask
        fields = '__all__'
