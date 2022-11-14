from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema
from apps.users.serializers  import UserSerializer

class Student(FactSchema):
    attend_date = models.DateTimeField(verbose_name="入学日期")
    grade = models.CharField(max_length=10, verbose_name="学年制")

    user = models.OneToOneField(to='users.User', on_delete=models.CASCADE, related_name="student_binder")

    classroom = models.ForeignKey(to='ClassRoom', on_delete=models.PROTECT, verbose_name='所在班级')
    courses = models.ManyToManyField(to='Course', verbose_name='选课课程')


class StudentSerializer(serializers.ModelSerializer):
    user = UserSerializer(many=False)
    class Meta:
        model = Student
        fields = '__all__'
