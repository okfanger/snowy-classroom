import request from '@/utils/request'
// 学生查看作业
export const checkWork = (courseId) => {
  return request({
    url: '/homework/student_homework',
    method: 'GET',
    params: {
      'course_id': courseId
    }
  })
}

// 老师发布作业
export const releaseHomework = (courseId, title, content, startTime, endTime) => {
  return request({
    url: '/homework/teacher_homework',
    method: 'POST',
    data: {
      'title': title,
      'course_id': courseId,
      'content': content,
      'start_time': startTime,
      'end_time': endTime

    }
  })
}
