# -*- coding: utf-8 -*-
# FileName: serializers
# Create by Hardy on 2022/3/29
# Description:

from rest_framework import serializers
from apps.bases.models import DictCode, DictType


class DictTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = DictType
        fields = "__all__"


class DictCodeSerializer(serializers.ModelSerializer):
    class Meta:
        model = DictCode
        fields = "__all__"
