import request from '@/utils/request'

export const createCourseAttendTask = (courseAttendDto) => {
  return request({
    url: '/attend/create-course-attend-task/',
    method: 'POST',
    data: courseAttendDto
  })
}
export const getCourseAttendBeforeCreateStatus = (courseId) => {
  return request({
    url: '/attend/course-attend-before-create-test/',
    method: 'POST',
    data: {
      courseId: courseId
    }
  })
}

export const getCourseAttendRecord = (courseId) => {
  return request({
    url: '/attend/course-attend-records/',
    method: 'GET',
    params: {
      courseId: courseId
    }
  })
}
