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

from apps.core.views.attend import CourseAttendCreateView, CourseAttendBeforeCreateView, CourseAttendRecordView, \
    CourseAttendSignInView

urlpatterns = [
    path('create-course-attend-task/', CourseAttendCreateView.as_view(), name='创建课程考勤任务'),
    path('course-attend-before-create-test/', CourseAttendBeforeCreateView.as_view(), name='创建课程考勤任务前的准备'),
    path('course-attend-records/', CourseAttendRecordView.as_view(), name='获取课程考勤记录'),
    path('course-attend-sign-in/', CourseAttendSignInView.as_view(), name='学生签到'),
]
