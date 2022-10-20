import request from '@/utils/request'
export const getRandomTeam = () => {
  return request({
    url: '/base/random-team/',
    method: 'POST'
  })
}

export const getRandomTeamGet = () => {
  return request({
    url: '/base/random-team/',
    method: 'GET'
  })
}

export const getVisitUsPercent = () => {
  return request({
    url: '/base/visit-us-percent/',
    method: 'GET'
  })
}

export const callMissZhuang = (msg) => {
  return request({
    url: '/base/visit-us-percent/',
    method: 'POST',
    data: {
      'msg': msg
    }
  })
}
