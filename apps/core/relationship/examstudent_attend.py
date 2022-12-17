from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema
from apps.core.entity.student import StudentSerializer
from apps.core.relationship.examquestion_result import ExamQuestionResultSerializer, ExamQuestionResultFullSerializer


class ExamStudentAttend(FactSchema):
    score = models.FloatField(verbose_name="总分")
    exam = models.ForeignKey(to="Exam",verbose_name="考试号", to_field='id', on_delete=models.CASCADE)
    course = models.ForeignKey(to="Course",verbose_name="课程号" ,to_field="id", on_delete=models.CASCADE)
    student = models.ForeignKey(to="Student",verbose_name="考生学生号", to_field="id", on_delete=models.CASCADE)
    is_done = models.BooleanField(verbose_name="是否完成", default=False, null=True)

class ExamStudentAttendSerializer(serializers.ModelSerializer):
    student = StudentSerializer(read_only=True)
    class Meta:
        model = ExamStudentAttend
        fields = '__all__'

class ExamStudentAttendFullSerializer(serializers.ModelSerializer):
    examquestionresult_set = ExamQuestionResultFullSerializer(many=True, read_only=True)
    class Meta:
        model = ExamStudentAttend
        fields = '__all__'
