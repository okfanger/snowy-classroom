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
# from rest_framework_simplejwt.views import TokenObtainPairView, TokenVerifyView, TokenRefreshView
from rest_framework_simplejwt.views import TokenRefreshView, TokenVerifyView

from apps.core.utils.qrcode import QRCodeView
from apps.users.authentication import MyTokenObtainPairView
from apps.users.views import UserInfoView, UserForgetView, UserRegisterView, UserNavView

urlpatterns = [
    # 获取/刷新/验证 token

    # path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # path('verify/', TokenVerifyView.as_view(), name='token_verify'),

    # 获取Token的接口
    path('auth/login/', MyTokenObtainPairView.as_view(), name='token_obtain_pair'),
    # 刷新Token有效期的接口
    path('auth/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # 验证Token的有效性
    path('auth/verify/', TokenVerifyView.as_view(), name='token_verify'),

    # 忘记密码
    path('user/forget/', UserForgetView.as_view(), name="user_forget"),
    # 用户信息
    path('user/info/', UserInfoView.as_view(), name='token_verify'),
    # 注册用户
    path('user/register/', UserRegisterView.as_view(), name="user_register"),
    # 用户权限菜单
    path('user/nav/', UserNavView.as_view(), name="user_nav"),


    #生成二维码工具类
    path('qrcode/', QRCodeView.as_view(), name="qrcode"),
]
