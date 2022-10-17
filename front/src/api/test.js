import request from 'axios'
export const getWeather = () => {
  return request({
    url: '/tenapi/yiyan/?format=json',
    method: 'GET',
    data: {
    }
  })
}

export const getHistory = () => {
  return request({
    url: '/tenapi/lishi/?format=json',
    method: 'GET',
    data: {}
  })
}

export const getTel = () => {
  return request({
    url: '/tenapi/tel/?tel=18888888888',
    method: 'GET',
    data: {

    }
  })
}
