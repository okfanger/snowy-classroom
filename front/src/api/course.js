import request from '@/utils/request'

export const getStudentAll = (queryParams = {}) => {
  return request({
    url: '/course/all/',
    method: 'GET',
    params: queryParams
  })
}

export const getStudentOne = (id) => {
  return request({
    url: '/course/one/',
    method: 'GET',
    params: {
      id: id
    }
  })
}

export const getTeacherAll = () => {
  return request({
    url: '/course/all/',
    method: 'GET',
    params: {
    }
  })
}

export const getTeacherOne = (id) => {
  return request({
    url: '/course/one/',
    method: 'GET',
    params: {
      id: id
    }
  })
}

export const getStudents = (id) => {
  return request({
    url: '/course/students-by-id/',
    method: 'GET',
    params: {
      id: id
    }
  })
}
