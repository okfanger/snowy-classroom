import qrcode
from django.http import HttpResponse
from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView
from apps.users.myJWTAuthentication import MyJWTAuthentication
from urllib.parse import urlencode, unquote


# 给定url生成二维码


class QRCodeView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = []

    def get(self, request: Request):
        url = request.query_params['url']
        url = unquote(url)
        img = qrcode.make(url)
        response = HttpResponse(content_type="image/png")
        img.save(response, "PNG")
        return response

