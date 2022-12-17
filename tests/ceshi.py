import requests

from tests import util
from tests.test_auth import BASE_URL
from tests.util import get_token


def demo1():
    url = BASE_URL + '/auth/login/'
    resp = requests.post(url, data={
        "username": "2020122104559",
        "password": "827ccb0eea8a706c4c34a16891f84e7b"
    })

    json_resp = resp.json()
    print(json_resp)

def demo2():
    url = BASE_URL + '/attend/course-attend-update-batch/'
    token = get_token('misslee', '827ccb0eea8a706c4c34a16891f84e7b')
    resp = requests.post(url, data={
        'courseId': 4,
        'dataList': []
    }, headers={
        'Authorization': 'Bearer ' + token
    })

    resp_json = resp.json()
    print(resp_json)

demo2()