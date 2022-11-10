import request from '@/utils/request'

export const getStudentAll = (queryParams = {}) => {
  return request({
    url: '/course/all/',
    method: 'GET',
    params: queryParams
  })
}
