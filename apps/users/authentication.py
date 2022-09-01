from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.exceptions import InvalidToken, AuthenticationFailed
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import exceptions

from django.utils.translation import gettext_lazy as _

from apps.users.models import User


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    """
    自定义登录认证，使用自有用户表
    """
    username_field = 'code'

    def validate(self, attrs):
        authenticate_kwargs = {self.username_field: attrs[self.username_field], 'password': attrs['password']}
        print(authenticate_kwargs)
        try:
            user = User.objects.get(**authenticate_kwargs)
        except Exception as e:
            raise exceptions.NotFound(e.args[0])

        refresh = self.get_token(user)

        data = {"userId": user.id, "token": str(refresh.access_token), "refresh": str(refresh)}
        return data


class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer


class MyJWTAuthentication(JWTAuthentication):
    '''
    修改JWT认证类，返回自定义User表对象
    '''
    def get_user(self, validated_token):
        try:
            user_id = validated_token['user_id']
        except KeyError:
            raise InvalidToken(_('Token contained no recognizable user identification'))

        try:
            user = User.objects.get(**{'id': user_id})
        except User.DoesNotExist:
            raise AuthenticationFailed(_('User not found'), code='user_not_found')

        return user
