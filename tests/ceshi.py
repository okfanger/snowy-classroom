import requests

from tests.test_auth import BASE_URL

def demo1():
    url = BASE_URL + '/auth/login/'
    resp = requests.post(url, data={
        "username": "2020122104559",
        "password": "827ccb0eea8a706c4c34a16891f84e7b"
    })

    json_resp = resp.json()
    print(json_resp)

def demo2():
    url = BASE_URL + '/course/all/'
    resp = requests.get(url, data={})
    json_resp = resp.json()
    print(json_resp)


demo2()