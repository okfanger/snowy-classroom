# 两种写法： 函数 类
# xxxxxxView
import random

from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import SuccessResponse, ErrorResponse
from apps.users.myJWTAuthentication import MyJWTAuthentication
from apps.users.permissions import IsStudent, IsTeacher, IsAdmin


def ret_team():
    teams = ["亚特兰大老鹰队", "波士顿凯尔特人队", "芝加哥公牛队", "达拉斯独行侠队", "丹佛掘金队"]
    print(random.choice(teams))


"""
需求：
1. 需要一个进度条，展示庄老师来看望计科3的进度条。（每隔5秒刷新一次）
2. 老段呼叫庄老师(需要带话)（效果：（random%10 + 1） 的进度）

后端：1. GET /base/visit-us-percent/ 获取进度条的 percent 值
	2. POST /base/visit-us-percent/ 呼叫庄老师

前端： 1. 进度条
	 2. 两个 request 请求
	 3. 其中一个 定时器+ 用按钮点击控制
"""

zhuang_percent = 0


class BaseVisitUsPercentView(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def get(self, request):
        return SuccessResponse(data={
            "percent": zhuang_percent
        })

    def post(self, request: Request):
        global zhuang_percent

        # 从request里面拿到前端传来的数据
        # post请求
        data = request.data
        # get 请求
        # request.query_params
        msg = data["msg"]
        print("给庄老师报信：" + msg)

        if zhuang_percent >= 99:
            return ErrorResponse(msg="好的")
        zhuang_percent += random.randint(1, 10)
        return SuccessResponse(data="很快")


# class BaseRandomTeam extends APIView
class BaseRandomTeam(APIView):
    authentication_classes = [MyJWTAuthentication]  # 认证：识别你的身份
    # 闯关制 || &&
    # 想让谁进，就 IsWho
    # 只要你登录了 我就放你进去 IsAuthenticated
    permission_classes = [IsStudent]  # 权限：决定你能不能访问

    # 学生可见，教师可见、管理员可见

    def get(self, request: Request):
        # 有 MyJWTAuthentication 在的时候，
        # 可以通过 request.user 拿到当前用户的信息

        tel = request.query_params
        print(tel)
        # # xxxx
        # res = "呼市"

        return SuccessResponse(data={
            "name": "呼市",
            "id": "010010"
        }, msg="你通过 GET 请求访问到我")

    def post(self, request):
        # xxx 各种处理的逻辑

        return ErrorResponse(data="你通过 POST 请求访问到我", msg="我知道你错了")


color_set = ['pink', 'red', 'orange', 'green', 'cyan', 'blue', 'purple']


class BaseChangeColor(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsStudent]

    def get(self, request):
        return SuccessResponse(data={
            "color": random.choice(color_set)
        })

    def post(self, request: Request):
        final_color = random.choice(color_set)
        if final_color == 'red':
            return ErrorResponse(data={
                "color": final_color
            }, msg="有危险")
        else:
            return SuccessResponse(data={
                "color": final_color
            })


ikun_purity = 0


class BashIsIkun(APIView):
    authentication_classes = [MyJWTAuthentication]
    permission_classes = [IsTeacher]

    def get(self, request):
        return SuccessResponse(data={
            "ikun_purity": ikun_purity
        })

    def post(self, request: Request):
        global ikun_purity
        data = request.data
        print(data)
        height = data["height"]
        weight = data["weight"]
        constellation = data["constellation"]
        blood_type = data["bloodType"]
        hobby = data["hobby"]
        if height == "184":
            ikun_purity += 20
            print("1", ikun_purity)
        if weight == "60":
            ikun_purity += 20
            print("2", ikun_purity)
        if constellation == "金牛座":
            ikun_purity += 20
            print("3", ikun_purity)
        if blood_type == "A":
            ikun_purity += 20
            print("4", ikun_purity)
        if hobby == "打篮球":
            ikun_purity += 20
            print("5", ikun_purity)

        if ikun_purity <= 80:
            return ErrorResponse(msg="坤度不纯")
        return SuccessResponse(data="你最好是")


# 1. 起名字

# 2. 继承 APIView 这个类
# 3. 重写 get(), post()... 方法
# 4. 记得留一个形参 request
# 5. return 响应

# 6. 响应的选择: SuccessResponse 成功时的响应, ErrorResponse 失败时的响应

if __name__ == "__main__":
    ret_team()
