from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class ClassRoom(FactSchema):
    grade = models.CharField(verbose_name="所属年级")
    adviser = models.ForeignKey(to='User', verbose_name="", on_delete=models.PROTECT)

class ClassRoomSerializer(serializers.ModelSerializer):
    class Meta:
        model = ClassRoom
        fields = '__all__'
