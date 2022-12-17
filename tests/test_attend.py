# urlpatterns = [
#     path('create-course-attend-task/', CourseAttendCreateView.as_view(), name='创建课程考勤任务'),
#     path('course-attend-before-create-test/', CourseAttendBeforeCreateView.as_view(), name='创建课程考勤任务前的准备'),
#     path('course-attend-records/', CourseAttendRecordView.as_view(), name='获取课程考勤记录'),
#     path('course-attend-sign-in/', CourseAttendSignInView.as_view(), name='学生签到'),
#     path('course-attend-one/', CourseAttendRecordOneView.as_view(), name='获取单个课程考勤记录'),
#     path('course-attend-update-batch/', CourseAttendUpdateBatchView.as_view(), name='获取单个课程考勤记录'),
# ]
import requests

from tests.util import get_token

BASE_URL = 'http://localhost:8032'
def test_craete_course_attend_task():
    url = BASE_URL + '/attend/create-course-attend-task/'
    data = {
        'courseId': 4,
        'duration': 0.5,
    }
    token = get_token('misslee', '827ccb0eea8a706c4c34a16891f84e7b')
    resp = requests.post(url, data=data, headers={
                         'Authorization': 'Bearer ' + token
    })
    resp_json = resp.json()
    assert resp_json['status'] == 200
    assert resp_json['data']['id'] != None

    url = BASE_URL + '/attend/create-course-attend-task/'
    data = {
        'courseId': 4,
        'duration': 0.5,
    }
    resp = requests.post(url, data=data, headers={
                         'Authorization': 'Bearer ' + token
    })
    resp_json = resp.json()
    assert resp_json['status'] != 200
    assert resp_json['message'] == '当前课程有未结束的考勤任务'


def test_course_attend_record():
    url = BASE_URL + '/attend/course-attend-before-create-test/'
    token = get_token('misslee', '827ccb0eea8a706c4c34a16891f84e7b')
    resp = requests.get(url, params={
        'courseId': 4
    }, headers={
        'Authorization': 'Bearer ' + token
    })
    resp_json = resp.json()
    assert resp_json['status'] == 200

def test_course_record_one():
    url = BASE_URL + '/attend/course-attend-one/'
    token = get_token('misslee', '827ccb0eea8a706c4c34a16891f84e7b')
    resp = requests.get(url, params={
        'id': 1
    }, headers={
        'Authorization': 'Bearer ' + token
    })

    resp_json = resp.json()
    assert resp_json['status'] == 200

def test_course_attend_sign_in():
    url = BASE_URL + '/attend/course-attend-sign-in/'
    token = get_token('2020122104571', '827ccb0eea8a706c4c34a16891f84e7b')
    resp = requests.post(url, data={
        'courseAttendId': 1
    }, headers={
        'Authorization': 'Bearer ' + token
    })
    resp_json = resp.json()
    assert resp_json['status'] != 200


def test_course_attend_update_batch():
    url = BASE_URL + '/attend/course-attend-update-batch/'
    token = get_token('misslee', '827ccb0eea8a706c4c34a16891f84e7b')
    resp = requests.post(url, data={
        'courseId': 4,
        'dataList': []
    }, headers={
        'Authorization': 'Bearer ' + token
    })
    resp_json = resp.json()
    assert resp_json['status'] != 200