from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class Homework(FactSchema):

    title = models.CharField(verbose_name='作业标题', max_length=256)
    content = models.TextField(verbose_name='内容')
    start_time = models.DateTimeField(verbose_name='开始时间')
    end_time = models.DateTimeField(verbose_name='截止时间')

    course = models.ForeignKey(to='Course', verbose_name='课程', on_delete=models.CASCADE)
    # creator = models.ForeignKey(to='Teacher', verbose_name='创建者', on_delete=models.PROTECT)



class HomeworkSerializer(serializers.ModelSerializer):
    class Meta:
        model = Homework
        fields = '__all__'
