"""back URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from apps.core.views.base import BaseRandomTeam, BaseVisitUsPercentView, BaseChangeColor, BashIsIkun, \
    BaseDatabaseTestView

urlpatterns = [
    path('random-team/', BaseRandomTeam.as_view(), name='随机队伍'),
    path("visit-us-percent/", BaseVisitUsPercentView.as_view(), name="呼叫庄老师"),
    path('color-change/', BaseChangeColor.as_view(), name='改变颜色'),
    path('ikun_purity/', BashIsIkun.as_view(), name="坤度"),

    path('database-test/', BaseDatabaseTestView.as_view(), name="数据库测试")
]
