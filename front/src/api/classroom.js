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
// 老师获取自己带的所有课程
export const publishNotice = (teacher) => {
  return request({
    url: '/classroom/teacher_publish_notice/',
    method: 'GET',
    data: {
      'teacher': teacher
    }
  })
}
// 老师获取自己带的所有课程
export const CheckNotice = (teacher) => {
  return request({
    url: '/classroom/teacher_check_notice/',
    method: 'GET',
    data: {
      'teacher': teacher
    }
  })
}
