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
from django.urls import path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenVerifyView, TokenRefreshView

urlpatterns = [
    # django自带的 == 不用管
    path("admin/", admin.site.urls),
    # django-rest-framework == 不用管
    path('api-auth/', include('rest_framework.urls')),

    # 系统鉴权用的 url
    path("", include("apps.users.urls")),

    # @author: 方宇杰
    path("base/", include("apps.core.urls.base")),
    path("exam/", include("apps.core.urls.exam")),

    # @author: 谷志妍
    path("attend/", include("apps.core.urls.attend")),
    path("course/", include("apps.core.urls.course")),

    # @author: 段睿丰
    path("classroom/", include("apps.core.urls.classroom")),
    path("innermail/", include("apps.core.urls.innermail")),

    # @author: 徐欢
    path("homework/", include("apps.core.urls.homework")),
    path("group/", include("apps.core.urls.group")),
]
