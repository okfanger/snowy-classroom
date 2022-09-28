from django.db import models
from rest_framework import serializers

from apps.bases.models import FactSchema


class InnerMail(FactSchema):

    content = models.TextField(verbose_name="发件内容")
    title = models.CharField(verbose_name="发件标题", max_length=255)
    send_date = models.DateTimeField(verbose_name="发送日期")
    receive_date = models.DateTimeField(verbose_name="接收日期")

    from_user = models.ForeignKey(verbose_name="发送方", to="users.User", on_delete=models.CASCADE, related_name="send_emails")
    to_user = models.ForeignKey(verbose_name="接收方", to="users.User", on_delete=models.CASCADE, related_name="receive_emails")


class InnerMailSerializer(serializers.ModelSerializer):

    class Meta:
        model = InnerMail
        fields = '__all__'
