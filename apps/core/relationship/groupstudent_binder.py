from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class GroupStudentBinder(FactSchema):
    leader = models.BooleanField(verbose_name="是否为班委")

    group = models.ForeignKey("Group", verbose_name="组", on_delete=models.CASCADE)
    student = models.ForeignKey("Student", verbose_name="学生", on_delete=models.CASCADE)
    course = models.ForeignKey("Course", verbose_name="课程", on_delete=models.CASCADE)




class GroupStudentBinderSerializer(serializers.ModelSerializer):
    class Meta:
        model = GroupStudentBinder
        fields = "__all__"
