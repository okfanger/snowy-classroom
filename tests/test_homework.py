import requests

from tests import util
from tests.test_auth import BASE_URL


class TestHomework:
    def test_student_permisson(self):
        """
        测试学生权限
        """
        url = BASE_URL + '/homework/teacher_homework/'
        token = util.get_token("2020122104559", "827ccb0eea8a706c4c34a16891f84e7b")
        resp = requests.get(url, data={}, headers={
            'Authorization': 'Bearer ' + token
        })

        json_resp = resp.json()
        assert json_resp['message'] == '您没有执行该操作的权限。'

    def test_teacher_permisson(self):
        """
        测试老师权限
        """
        url = BASE_URL + '/homework/teacher_homework/'
        token = util.get_token("misslee", "827ccb0eea8a706c4c34a16891f84e7b")
        resp = requests.get(url, data={}, headers={
            'Authorization': 'Bearer ' + token
        })

        json_resp = resp.json()
        assert json_resp['message'] != '您没有执行该操作的权限。'

    def test_success(self):
        url = BASE_URL + '/homework/teacher_homework/'
        token = util.get_token("misslee", "827ccb0eea8a706c4c34a16891f84e7b")
        resp = requests.get(url, data={
          'course': 4,
          'title': '作业1',
          'content': '这是一个作业',
          'start_time': '2020-12-21 00:00:00',
          'end_time': '2020-12-21 23:59:59',
        }, headers={
            'Authorization': 'Bearer ' + token
        })

        json_resp = resp.json()
        assert json_resp['status'] == 200

