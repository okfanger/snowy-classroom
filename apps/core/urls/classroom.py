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
from django.urls import path

from apps.core.views.classroom.approval import TeacherApproval
from apps.core.views.classroom.leave import StudentLeave, CheckLeave
from apps.core.views.classroom.publishNotice import PublishNotice

urlpatterns = [
    path("student_leave/", StudentLeave.as_view(), name="学生请假"),
    path("student_check_leave/", CheckLeave.as_view(), name="学生查看假条"),
    path("teacher_approval/", TeacherApproval.as_view(), name="老师审批"),
    path("teacher_publish_notice/", PublishNotice.as_view(), name="发布公告"),
]
