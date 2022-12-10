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

// 学生查看假条
export const StuCheckLeave = (searchTime) => {
  return request({
    url: '/classroom/student_check_leave/',
    method: 'GET',
    params: {
      'search_time': searchTime
    }
  })
}

// 老师获取自己所带课程的全部假条
export const TeaCheckLeave = (searchTime) => {
  return request({
    url: '/classroom/teacher_approval/',
    method: 'GET',
    params: {
      'search_time': searchTime
    }
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

// 老师获取自己带的所有课程
export const CheckCourse = () => {
  return request({
    url: '/classroom/teacher_publish_notice/',
    method: 'GET'
  })
}

// 老师发布公告
export const publishNotice = (course, title, content) => {
  return request({
    url: '/classroom/teacher_publish_notice/',
    method: 'POST',
    data: {
      'course': course,
      'title': title,
      'content': content
    }
  })
}

// 老师查看公告
export const CheckNotice = (searchMsg) => {
  return request({
    url: '/classroom/teacher_check_notice/',
    method: 'GET',
    params: {
      'search_msg': searchMsg
    }
  })
}

// 返回所有学生
export const CheckStudents = (searchMsg) => {
  return request({
    url: '/classroom/teacher_pick_monitor/',
    method: 'GET',
    params: {
      'search_msg': searchMsg
    }
  })
}

// 返回选择班委
export const PickMonitor = (stuId) => {
  return request({
    url: '/classroom/teacher_pick_monitor/',
    method: 'POST',
    data: {
      'stu_id': stuId
    }
  })
}
// 学生查看班委
export const CheckMonitorStudent = () => {
  return request({
    url: '/classroom/student_check_monitor/',
    method: 'GET'
  })
}

// 管理员查看假条
export const CheckLeaveAdmin = () => {
  return request({
    url: '/classroom/admin_check_leave/',
    method: 'GET'
  })
}

// 管理员查看假条
export const CheckMonitorAdmin = () => {
  return request({
    url: '/classroom/admin_check_monitor/',
    method: 'GET'
  })
}

// 管理员查看公告
export const CheckNoticeAdmin = () => {
  return request({
    url: '/classroom/admin_check_notice/',
    method: 'GET'
  })
}
