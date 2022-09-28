from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema
from apps.core.relationship.groupstudent_binder import GroupStudentBinder


class Group(FactSchema):
    name = models.CharField(verbose_name="组名", max_length=256)

    course = models.ForeignKey(to="Course", on_delete=models.CASCADE)
    students = models.ManyToManyField(to="Student", through=GroupStudentBinder)


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = '__all__'