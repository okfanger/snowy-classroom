import requests

from tests import util

BASE_URL = 'http://localhost:8032'

def test_course_find_all1():
    url = BASE_URL + '/course/all/'
    token = util.get_token("2020122104571", "827ccb0eea8a706c4c34a16891f84e7b")
    resp = requests.get(url, data={}, headers={
        'Authorization': 'Bearer ' + token
    })

    resp_json = resp.json()
    assert resp_json['status'] == 200
    assert resp_json['data']['result'] != None


def test_course_find_all2():
    url = BASE_URL + '/course/all/'
    token = util.get_token("misslee", "827ccb0eea8a706c4c34a16891f84e7b")
    resp = requests.get(url, data={}, headers={
        'Authorization': 'Bearer ' + token
    })

    resp_json = resp.json()
    assert resp_json['status'] == 200
    assert resp_json['data']['result'] != None


def test_course_find_one():
    url = BASE_URL + '/course/one/'
    token = util.get_token("misslee", "827ccb0eea8a706c4c34a16891f84e7b")
    resp = requests.get(url, params={
        "id": 4
    }, headers={
        'Authorization': 'Bearer ' + token
    })

    resp_json = resp.json()
    assert resp_json['status'] == 200
    assert resp_json['data']['id'] == 4
    assert resp_json['data']['name'] == '软件工程概论'


def test_course_get_students():
    url = BASE_URL + '/course/students-by-id/'
    token = util.get_token("misslee", "827ccb0eea8a706c4c34a16891f84e7b")
    resp = requests.get(url, params={
        "id": 4
    }, headers={
        'Authorization': 'Bearer ' + token
    })

    resp_json = resp.json()
    assert resp_json['status'] == 200