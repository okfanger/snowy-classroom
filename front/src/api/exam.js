import request from '@/utils/request'

export const getExamByCourse = (id) => {
  return request({
    url: '/exam/all-by-course/',
    method: 'GET',
    params: {
      id: id
    }
  })
}

export const getExamDetailById = (examId) => {
  return request({
    url: '/exam/one/',
    method: 'GET',
    params: {
      id: examId
    }
  })
}
