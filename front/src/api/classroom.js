import request from '@/utils/request'
// 发送邮件
export const StudentLeave = (student, course, leaveType, reason, startTime, endTime) => {
  return request({
    url: '/classroom/student_leave/',
    method: 'POST',
    data: {
      'student': student,
      'course': course,
      'leave_type': leaveType,
      'reason': reason,
      'start_time': startTime,
      'end_time': endTime
    }
  })
}
// 获取全部课程
export const getAllCourse = () => {
  return request({
    url: '/classroom/student_leave/',
    method: 'GET'
  })
}

// 获取全部课程
export const StuCheckLeave = () => {
  return request({
    url: '/classroom/student_check_leave/',
    method: 'GET'
  })
}

// 老师获取自己所带课程的全部假条
export const TeaCheckLeave = () => {
  return request({
    url: '/classroom/teacher_approval/',
    method: 'GET'
  })
}

// 老师审批假条
export const TeacherApproval = (leaveId, status) => {
  return request({
    url: '/classroom/teacher_approval/',
    method: 'POST',
    data: {
      'leaveId': leaveId,
      'status': status
    }
  })
}
