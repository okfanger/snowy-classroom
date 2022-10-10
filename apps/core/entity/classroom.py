from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class ClassRoom(FactSchema):
    name = models.CharField(verbose_name="班级名字", max_length=256)
    adviser = models.ForeignKey(to='Teacher', verbose_name="班主任", on_delete=models.PROTECT)
    # students = models.ManyToManyField(to="Student", verbose_name="选课学生")


class ClassRoomSerializer(serializers.ModelSerializer):
    class Meta:
        model = ClassRoom
        fields = '__all__'
