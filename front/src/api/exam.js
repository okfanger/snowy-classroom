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
