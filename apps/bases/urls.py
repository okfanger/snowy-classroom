# -*- coding: utf-8 -*-
# FileName: urls
# Create by Hardy on 2022/3/29
# Description:

from django.urls import path
from django.conf.urls import include
from rest_framework.routers import DefaultRouter
from apps.bases import views

router = DefaultRouter()
router.register(r'dict-codes', views.DictCodeViewSet)
router.register(r'dict-types', views.DictTypeViewSet)

urlpatterns = [
    path('', include(router.urls)),
]