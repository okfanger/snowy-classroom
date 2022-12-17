import requests

from tests import util

BASE_URL = 'http://localhost:8032'


# 当数据全部正确时
def test_student_leave1(self):
    token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/student_leave/'
    resp = requests.post(url,
                         data={
                             'course': '高等数学',
                             'leave_type': '事假',
                             'reason': '回家',
                             'start_time': '2022-12-17 23:00',
                             'end_time': '2022-12-24 23:00'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 当course为None时
def test_student_leave2(self):
    token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/student_leave/'
    resp = requests.post(url,
                         data={
                             'course': None,
                             'leave_type': '事假',
                             'reason': '回家',
                             'start_time': '2022-12-17 23:00',
                             'end_time': '2022-12-24 23:00'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 201


# 当course不存在时
def test_student_leave3(self):
    token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/student_leave/'
    resp = requests.post(url,
                         data={
                             'course': 'Java基础',
                             'leave_type': '事假',
                             'reason': '回家',
                             'start_time': '2022-12-17 23:00',
                             'end_time': '2022-12-24 23:00'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 201


# 学生查看假条
def test_student_check_leave(self):
    token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/student_check_leave/'
    resp = requests.get(url,
                        params={
                            'search_time': 'Invalid date'
                        },
                        headers={
                            'Authorization': 'Bearer ' + token
                        })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 返回所有课程
def test_show_all_course(self):
    token = util.get_token("2020122104593", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/student_leave/'
    resp = requests.get(url, params={},
                        headers={
                            'Authorization': 'Bearer ' + token
                        })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 老师查看假条
def test_teacher_check_leave(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_approval/'
    resp = requests.get(url,
                        params={
                            'search_time': 'Invalid date'
                        },
                        headers={
                            'Authorization': 'Bearer ' + token
                        })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# status=1 通过
# status=2 正在审批
# status=3 未通过
# 老师批改假条 status=1时
def test_teacher_approval_leave1(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_approval/'
    resp = requests.post(url,
                         data={
                             'leaveId': '1',
                             'status': '1'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 老师批改假条 status=2时
def test_teacher_approval_leave2(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_approval/'
    resp = requests.post(url,
                         data={
                             'leaveId': '1',
                             'status': '2'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 老师批改假条 status=3时
def test_teacher_approval_leave3(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_approval/'
    resp = requests.post(url,
                         data={
                             'leaveId': '1',
                             'status': '3'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 老师批改假条 status=4时
def test_teacher_approval_leave4(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_approval/'
    resp = requests.post(url,
                         data={
                             'leaveId': '1',
                             'status': '4'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 201


# 返回当前老师所带的所有班级
def test_show_teacher_course(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_publish_notice/'
    resp = requests.get(url, params={},
                        headers={
                            'Authorization': 'Bearer ' + token
                        })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 当所有数据全部正确时
def test_teacher_publish_notice(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_publish_notice/'
    resp = requests.post(url,
                         data={
                             'classroom': '20计科三',
                             'title': '这是公告',
                             'content': '这是公告内容'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 当classroom为None时
def test_teacher_publish_notice1(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_publish_notice/'
    resp = requests.post(url,
                         data={
                             'classroom': None,
                             'title': '这是公告',
                             'content': '这是公告内容'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 201


# 当classroom不是老师所带班级时
def test_teacher_publish_notice3(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_publish_notice/'
    resp = requests.post(url,
                         data={
                             'classroom': '20计科四',
                             'title': '这是公告',
                             'content': '这是公告内容'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 201


# 当title为None时
def test_teacher_publish_notice4(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_publish_notice/'
    resp = requests.post(url,
                         data={
                             'classroom': '20计科三',
                             'title': None,
                             'content': '这是公告内容'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 201


# 当content为None时
def test_teacher_publish_notice5(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_publish_notice/'
    resp = requests.post(url,
                         data={
                             'classroom': '20计科三',
                             'title': '这是公告',
                             'content': None
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 201


# 老师查看自己发布的公告
def test_teacher_check_notice(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_check_notice/'
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


# 返回当前老师所带班级的所有学生
def test_show_all_student(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_pick_monitor/'
    resp = requests.get(url,
                        params={
                            'search_msg': '',
                        },
                        headers={
                            'Authorization': 'Bearer ' + token
                        })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 当学生id存在时
def test_teacher_pick_monitor1(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_pick_monitor/'
    resp = requests.post(url,
                         data={
                             'stu_id': '3'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 200


# 当学生id不存在时
def test_teacher_pick_monitor2(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/teacher_pick_monitor/'
    resp = requests.post(url,
                         data={
                             'stu_id': '100'
                         },
                         headers={
                             'Authorization': 'Bearer ' + token
                         })
    json_resp = resp.json()
    assert json_resp['status'] == 201


# 学生查看班委
def test_student_check_monitor(self):
    token = util.get_token("misszhuang", "827ccb0eea8a706c4c34a16891f84e7b")
    url = BASE_URL + '/classroom/student_check_monitor/'
    resp = requests.get(url, params={},
                        headers={
                            'Authorization': 'Bearer ' + token
                        })
    json_resp = resp.json()
    assert json_resp['status'] == 200
