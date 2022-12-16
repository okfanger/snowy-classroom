import requests


def calc_add(a, b):
    return a + b

# def calc_sub(a, b):
#     return a - b

# 断言
# 我们的代码执行的结果和我们预期的结果是不是一样
# 求片
class TestDemo:
    def test_add1(self):
        answer = calc_add(1, 2)
        assert answer == 3

    # def test_add2(self):
    #     answer = calc_sub(1, 2)
    #     assert answer == 3

BASE_URL = 'http://localhost:8032'
class TestDemo2:
    def test_color(self):
        url = BASE_URL + '/base/color-change/'
        resp = requests.get(url, data={})
        json_resp = resp.json() # 把接口返回数据转换成json（字典）
        color_set = ['pink', 'red', 'orange', 'green', 'cyan', 'blue', 'purple']
        color_resp = json_resp['data']['color']
        assert color_resp in color_set

    def test_danger(self):
        url = BASE_URL + '/base/color-change/'
        resp = requests.post(url, data={})
        json_resp = resp.json() # 把接口返回数据转换成json（字典）

        if json_resp['status'] == 200:
            assert json_resp['data']['color'] != 'red'
        else:
            assert json_resp['data']['color'] == 'red'

