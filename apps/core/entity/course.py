import random

from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema
from apps.core.entity.teacher import TeacherSerializer, TeacherNoCourseSerializer


class Course(FactSchema):
    name = models.CharField(verbose_name='课程名', max_length=256)
    open_time = models.DateTimeField(verbose_name="开设时间", null=True)
    completed = models.BooleanField(verbose_name="完成情况", null=True, default=True)

    # students = models.ManyToManyField(to='Student', verbose_name='选课学生')
    # teachers = models.ManyToManyField(to='Teacher', verbose_name="教师")


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'
        # fields = ['create_time', 'update_time']
        # exclude = ['create_time', 'update_time']


class CourseHasTeacherSerializer(serializers.ModelSerializer):
    teacher_set = TeacherNoCourseSerializer(read_only=True, many=True)

    class Meta:
        model = Course
        fields = '__all__'
