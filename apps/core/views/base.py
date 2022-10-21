# 两种写法： 函数 类
# xxxxxxView
import random

from rest_framework.permissions import IsAuthenticated
from rest_framework.request import Request
from rest_framework.views import APIView

from apps.bases.response import SuccessResponse, ErrorResponse
from apps.core.entity.student import Student
from apps.users.models import User
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


class BaseDatabaseTestView(APIView):

    authentication_classes = []
    permission_classes = []

    def get(self, request: Request):
        # 查

        # 1. 找到 models的类
        # 2. 调这个类的objects属性
        # 3. 进行一系列的操作

        # 查询所有的用户
        all_users = User.objects.all()

        # 根据单个属性精确查询
        # one_user = User.objects.get(id=104)

        # 筛选（筛选包含的）
        # all_users = User.objects.filter(type=2)
        ## 模糊查询（大于/小于/在...里(contains)/xxx）
        ## 格式： "字段__操作" 比如：id__in=[100, 200]
        ## __in 用于读取区间，= 号后面为列表 。
        ## __gt 大于号 ，= 号后面为数字。
        ## __gte 大于等于，= 号后面为数字。
        ## __lt 小于，=号后面为数字。
        ## __lte 小于等于，= 号后面为数字。
        ## __contains 包含，= 号后面为字符串。
        ## __icontains 不区分大小写的包含，= 号后面为字符串。
        ## __startswith 以指定字符开头，= 号后面为字符串。
        ## __endswith 以指定字符结尾，= 号后面为字符串。
        ## ----------------------------------------
        ## __year 是 DateField 数据类型的年份，= 号后面为数字。
        ## __month 是DateField 数据类型的月份，= 号后面为数字。
        ## __day 是DateField 数据类型的天数，= 号后面为数字。
        # all_users = User.objects.filter(id__in=[104, 105])


        # 筛选（筛选不包含的）
        # all_users = User.objects.exclude(name="方宇杰")

        # 排序
        # 降序为在字段前面加个负号 -。
        # 升序不需要加
        # all_users = User.objects.order_by("-id")
        # 链式编程

        # 反转 reverse()
        # all_users = all_users.order_by("id")

        # 数量
        print(all_users.count())

        # 打印第一个、最后一个
        print(all_users.first())
        print(all_users.last())

        # 查询是否存在
        print(User.objects.filter(name="齐天大圣").exists())

        # 如果不指定 values()，默认是查询所有字段
        # select * from ....
        # 在一开始就指定要查询字段的？

        values_list = User.objects.values("id")
        # select id from users_user
        print(values_list)

        # distinct （用不了）



        res_set = []
        for i in all_users:
            name = i.name
            tel = i.telephone
            pid = i.username
            res_set.append({
                "id": i.id,
                "name": name,
                "tel": tel,
                "pid": pid
            })

        return SuccessResponse(data=res_set)

    def post(self, request: Request):
        data = request.data
        action = data["action"]

        # 删 改 增
        if action == "增":
            pass
        elif action == "删":
            pass
        elif action == "改":
            pass

        return SuccessResponse(data="POST")





# 1. 起名字

# 2. 继承 APIView 这个类
# 3. 重写 get(), post()... 方法
# 4. 记得留一个形参 request
# 5. return 响应

# 6. 响应的选择: SuccessResponse 成功时的响应, ErrorResponse 失败时的响应

if __name__ == "__main__":
    ret_team()
