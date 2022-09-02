from django.shortcuts import render
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.views import APIView
from rest_framework_simplejwt import authentication

from apps.bases.response import SuccessResponse
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.serializers import UserSerializer


# Create your views here.
class UserInfoView(APIView):
    """
    获取用户信息
    """
    authentication_classes =  [MyJWTAuthentication, SessionAuthentication, BasicAuthentication]
    def get(self, request):
        user = request.user
        return SuccessResponse(data=UserSerializer(user).data)

class UserForgetView(APIView):
    """
    忘记密码
    """
    def post(self):
        pass


class UserRegisterView(APIView):
    def post(self, request):
        pass