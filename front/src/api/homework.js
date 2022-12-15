import request from '@/utils/request'
// 学生查看作业
export const checkWork = (courseId, homeworkId) => {
  return request({
    url: '/homework/student_homework/',
    method: 'GET',
    params: {
      'course_id': courseId,
      'homework_id': homeworkId
    }
  })
}

// 学生提交作业
export const submitWork = (homeworkId, courseId, submitDetail) => {
  return request({
    url: '/homework/student_homework/',
    method: 'POST',
    data: {
      'homework_id': homeworkId,
      'course_id': courseId,
      'submit_detail': submitDetail
    }
  })
}

// 老师发布作业
export const releaseHomework = (course, title, content, startTime, endTime) => {
  return request({
    url: '/homework/teacher_homework/',
    method: 'POST',
    data: {
      'course': course,
      'title': title,
      'content': content,
      'start_time': startTime,
      'end_time': endTime

    }
  })
}

// 老师查看/批改作业
export const checkHomework = () => {
  return request({
    url: '/homework/teacher_homework/',
    method: 'GET'
  })
}

export const getHomeworkDetail = (id) => {
  return request({
    url: '/homework/one/',
    method: 'GET',
    params: {
      id: id
    }
  })
}
