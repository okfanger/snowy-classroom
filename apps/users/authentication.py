
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import exceptions


from apps.users.models import User

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    """
    自定义登录认证，使用自有用户表
    """
    username_field = 'username'

    def validate(self, attrs):
        authenticate_kwargs = {self.username_field: attrs[self.username_field], 'password': attrs['password']}
        # print(authenticate_kwargs)
        try:
            user = User.objects.get(**authenticate_kwargs)
        except Exception as e:
            raise exceptions.APIException("用户名或密码错误")
            # raise exceptions.NotFound(e.args[0])

        refresh = self.get_token(user)

        data = {"userId": user.id, "token": str(refresh.access_token), "refresh": str(refresh)}
        return {
            "message": "success",
            "status": 200,
            "data": data
        }
        # return data

class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer

