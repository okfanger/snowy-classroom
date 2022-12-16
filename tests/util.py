import requests

BASE_URL = 'http://localhost:8032'
def get_token(username, password):
    resp = requests.post(BASE_URL + "/auth/login/", data={
        "username": username,
        "password": password
    })

    return resp.json()['data']['token']

if __name__=="__main__":
    print(get_token("2020122104559", "827ccb0eea8a706c4c34a16891f84e7b"))