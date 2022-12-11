from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsStudent


