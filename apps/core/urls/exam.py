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

from apps.core.views.exam import ExamByCourseView, ExamDetailById, ExamLiveSubmitView, ExamStudentStateView, \
    ExamStudentGenerateView, ExamOverView, ExamTeacherCreateOrUpdateView, ExamRemoveView, ExamQuestionOptionRemoveView, \
    ExamQuestionRemoveView, ExamSaveOptions,  ExamQuestionSaveOrUpdateView, ExamQuestionOptionSaveOrUpdateView

urlpatterns = [
    path("all-by-course/", ExamByCourseView.as_view()),
    path("one/", ExamDetailById.as_view()),
    path("state/", ExamStudentStateView.as_view()),
    path("generate/", ExamStudentGenerateView.as_view()),
    path("over/", ExamOverView.as_view()),
    path("live/submit/", ExamLiveSubmitView.as_view()),
    path("teacher/create/", ExamTeacherCreateOrUpdateView.as_view()),
    path("remove/", ExamRemoveView.as_view()),
    path("question/remove/", ExamQuestionRemoveView.as_view()),
    path("question/option/remove/", ExamQuestionOptionRemoveView.as_view()),
    path("question/save-or-update/", ExamQuestionSaveOrUpdateView.as_view()),
    path("question/option/save-or-update/", ExamQuestionOptionSaveOrUpdateView.as_view()),
    path("save-options/", ExamSaveOptions.as_view())
]
