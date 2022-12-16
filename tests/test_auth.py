import requests

from tests import util


BASE_URL = 'http://localhost:8032'
class TestAuth:
    def test_teacher_login(self):

        url = BASE_URL + '/auth/login/'
        resp = requests.post(url, data={
            "username": "2020122104559",
            "password": "827ccb0eea8a706c4c34a16891f84e7b"
        })

        json_resp = resp.json()
        assert json_resp['status'] == 200
        assert json_resp['data']['token'] != ''
        assert json_resp['data']['refresh'] != ''

    def test_teacher_login2(self):
        url = BASE_URL + '/auth/login/'
        resp = requests.post(url, data={
            "username": "",
            "password": ""
        })

        json_resp = resp.json()
        assert json_resp['status'] == 201

        resp = requests.post(url, data={
            "username": "123",
            "password": "xxxx"
        })

        json_resp = resp.json()
        assert json_resp['status'] == 201

    def test_no_permisson(self):
        url = BASE_URL + '/course/all/'
        resp = requests.get(url, data={})
        json_resp = resp.json()

        assert json_resp['status'] == 201
        assert json_resp['message'] == '身份认证信息未提供。'

    def test_has_permisson(self):
        url = BASE_URL + '/course/all/'
        token = util.get_token("2020122104559", "827ccb0eea8a706c4c34a16891f84e7b")
        resp = requests.get(url, data={}, headers={
                            'Authorization': 'Bearer ' + token
        })

        json_resp = resp.json()
        assert json_resp['status'] != 201
        assert json_resp['message'] != '身份认证信息未提供。'

    def test_has_student_permisson(self):
        url = BASE_URL + '/course/all/'
        token = util.get_token("2020122104559", "827ccb0eea8a706c4c34a16891f84e7b")
        resp = requests.get(url, data={}, headers={
            'Authorization': 'Bearer ' + token
        })

        json_resp = resp.json()
        assert json_resp['status'] != 201
        assert json_resp['message'] != '身份认证信息未提供。'