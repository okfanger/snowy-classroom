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

export const getColorChange = () => {
  return request({
    url: '/base/color-change/',
    method: 'GET'
  })
}

export const getColorWarn = (msg) => {
  return request({
    url: '/base/color-change/',
    method: 'POST',
    data: {
      'msg': msg
    }
  })
}

export const getIkunPurity = () => {
  return request({
    url: '/base/ikun_purity/',
    method: 'GET'
  })
}

export const testIkunPurity = (height, weight, constellation, bloodType, hobby) => {
  return request({
    url: '/base/ikun_purity/',
    method: 'POST',
    data: {
      'height': height,
      'weight': weight,
      'constellation': constellation,
      'bloodType': bloodType,
      'hobby': hobby
    }
  })
}

export const databaseTestGet = () => {
  return request({
    url: '/base/database-test/',
    method: 'GET'
  })
}

export const databaseTestPost = () => {
  return request({
    url: '/base/database-test/',
    method: 'POST'
  })
}
