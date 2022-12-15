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

from apps.core.views.homework import TeacherHomework, StudentHomework

urlpatterns = [
    path("teacher_homework/", TeacherHomework.as_view(), name="老师-作业"),
    path("student_homework/", StudentHomework.as_view(), name="学生-作业"),
]

'''
post 请求: 老师发布作业
request.data: [ 
    title 作业题目
    course_id 课程id
    content 作业内容
    start_time 开始时间
    end_time 结束时间
]
return :
'''
'''
get 请求: 老师查看/批改作业
request.query_params: [ course_id 课程id ]
return : msg_set([
    student 上交学生
    # homework_id 作业id(后续如果需要可以用这个)
    homework_title 作业题目
    submit_time 上交时间
    submit_detail 上交内容
]) 作业列表
'''
'''
get 请求: 学生查看作业
request.query_params: [ course_id 课程id ]
return : msg_set([
        homework_id 作业id
        title 作业题目
        content 作业内容
        start_time 开始时间
        end_time 结束时间
])
'''
'''
post 请求: 学生上交作业
request.data: [ 
        homework_id 作业id
        course_id 课程id
        submit_detail 上交内容
]
return :
'''
