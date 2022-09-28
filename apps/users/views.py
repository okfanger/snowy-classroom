from rest_framework.views import APIView
from apps.bases.response import SuccessResponse
from apps.users.models import MenuRouter
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.serializers import UserSerializer, UserRegisterSerializer, MenuRouterSerializer


# Create your views here.
class UserInfoView(APIView):
    """
    获取用户信息
    """
    authentication_classes = [MyJWTAuthentication]

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
    authentication_classes = ()
    permission_classes = ()
    """
    用户注册
    """

    def post(self, request):
        serializer = UserRegisterSerializer(data=request.data)

        is_vaild = serializer.is_valid(raise_exception=True)
        if not is_vaild:
            raise Exception("格式错误！")
        print(serializer.validated_data)
        serializer.save()

        return SuccessResponse(msg="注册成功")


class UserNavView(APIView):
    authentication_classes = [ MyJWTAuthentication ]

    def get(self, request):
        user = request.user
        menu_router = user.role.menu_routes

        return SuccessResponse(data={
            "result": MenuRouterSerializer(menu_router, many=True).data
        })

