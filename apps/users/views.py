from django.shortcuts import render
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.views import APIView
from rest_framework_simplejwt import authentication

from apps.bases.response import SuccessResponse
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.serializers import UserSerializer


# Create your views here.
class UserInfoView(APIView):

    authentication_classes =  [MyJWTAuthentication, SessionAuthentication, BasicAuthentication]
    def get(self, request):
        user = request.user
        return SuccessResponse(data=UserSerializer(user).data)
        # return SuccessResponse(request.user)


class UserForgetView(APIView):

    def post(self):
        pass
