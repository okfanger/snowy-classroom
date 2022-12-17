import requests

from tests import util

BASE_URL = 'http://localhost:8032'


class TestSendMail:

    # 当全部信息正确
    def test_send1(self):
        token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
        url = BASE_URL + '/innermail/send_mail/'
        resp = requests.post(url,
                             data={
                                 'content': '测试',
                                 'title': '这是测试',
                                 'to_user': '2020122104593'
                             },
                             headers={
                                 'Authorization': 'Bearer ' + token
                             })
        json_resp = resp.json()
        assert json_resp['data'] == 1

    # 当收件人不存在
    def test_send2(self):
        token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
        url = BASE_URL + '/innermail/send_mail/'
        resp = requests.post(url,
                             data={
                                 'content': '测试',
                                 'title': '这是测试',
                                 'to_user': 'aaaaaaaaaaaa'
                             },
                             headers={
                                 'Authorization': 'Bearer ' + token
                             })
        json_resp = resp.json()
        assert json_resp['data'] == 0

    # 当内容为 ''
    def test_send3(self):
        token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
        url = BASE_URL + '/innermail/send_mail/'
        resp = requests.post(url,
                             data={
                                 'content': '',
                                 'title': '这是测试',
                                 'to_user': '2020122104593'
                             },
                             headers={
                                 'Authorization': 'Bearer ' + token
                             })
        json_resp = resp.json()
        assert json_resp['message'] != 'success'

    # 当内容为 None
    def test_send4(self):
        token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
        url = BASE_URL + '/innermail/send_mail/'
        resp = requests.post(url,
                             data={
                                 'content': None,
                                 'title': '这是测试',
                                 'to_user': '2020122104593'
                             },
                             headers={
                                 'Authorization': 'Bearer ' + token
                             })
        json_resp = resp.json()
        assert json_resp['message'] != 'success'

    # 当标题为为 ''
    def test_send5(self):
        token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
        url = BASE_URL + '/innermail/send_mail/'
        resp = requests.post(url,
                             data={
                                 'content': '这是测试',
                                 'title': '',
                                 'to_user': '2020122104593'
                             },
                             headers={
                                 'Authorization': 'Bearer ' + token
                             })
        json_resp = resp.json()
        assert json_resp['message'] == 'success'

    # 当标题为为 None
    def test_send6(self):
        token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
        url = BASE_URL + '/innermail/send_mail/'
        resp = requests.post(url,
                             data={
                                 'content': '这是测试',
                                 'title': None,
                                 'to_user': '2020122104593'
                             },
                             headers={
                                 'Authorization': 'Bearer ' + token
                             })
        json_resp = resp.json()
        assert json_resp['message'] != 'success'


class TestReceiveMail:
    def test_receive(self):
        token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
        url = BASE_URL + '/innermail/receive_mail/'
        resp = requests.get(url,
                            params={
                                'search_msg': '',
                                'search_time': 'Invalid date'
                            },
                            headers={
                                'Authorization': 'Bearer ' + token
                            })
        json_resp = resp.json()
        assert json_resp['status'] == 200
        assert json_resp['message'] == 'success'
