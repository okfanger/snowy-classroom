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

from apps.core.views.classroom.PickMonitor import PickMonitor, CheckMonitor
from apps.core.views.classroom.admin import CheckLeaveAdmin, CheckMonitorAdmin, CheckNoticeAdmin
from apps.core.views.classroom.approval import TeacherApproval
from apps.core.views.classroom.leave import StudentLeave, CheckLeaveStudent
from apps.core.views.classroom.publishNotice import PublishNotice, CheckNotice

urlpatterns = [
    path("student_leave/", StudentLeave.as_view(), name="学生请假"),
    path("student_check_leave/", CheckLeaveStudent.as_view(), name="学生查看假条"),
    path("student_check_monitor/", CheckMonitor.as_view(), name="学生查看班委"),
    path("teacher_approval/", TeacherApproval.as_view(), name="老师审批"),
    path("teacher_publish_notice/", PublishNotice.as_view(), name="发布公告"),
    path("teacher_check_notice/", CheckNotice.as_view(), name="老师查看公告"),
    path("teacher_pick_monitor/", PickMonitor.as_view(), name="老师设立班委"),
    path("admin_check_leave/", CheckLeaveAdmin.as_view(), name="管理员查看假条"),
    path("admin_check_monitor/", CheckMonitorAdmin.as_view(), name="管理员查看假条"),
    path("admin_check_notice/", CheckNoticeAdmin.as_view(), name="管理员查看公告"),
]
