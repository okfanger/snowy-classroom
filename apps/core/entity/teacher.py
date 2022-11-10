from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema
from apps.users.serializers import UserSerializer


class Teacher(FactSchema):
    teach_age = models.IntegerField(verbose_name="教龄", null=False)
    rank = models.CharField(max_length=10, null=False, verbose_name="职称")
    desc = models.CharField(max_length=256, null=True, default="简介")

    user = models.OneToOneField(to='users.User', on_delete=models.CASCADE, verbose_name='绑定的用户',
                                related_name="teacher_binder")
    courses = models.ManyToManyField(to='Course', verbose_name='教课课程')


class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = '__all__'

class TeacherNoCourseSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True, many=False)
    class Meta:
        model = Teacher
        exclude = ['courses']