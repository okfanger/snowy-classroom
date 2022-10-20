import request from 'axios'
export const getWeather = () => {
  return request({
    url: '/tenapi/yiyan/?format=json',
    method: 'GET',
    data: {

    }
  })
}
/*
export const getHistory = () => {
  return request({
    url: '/tenapi/lishi/',
    method: 'GET',
    data: {

    }
  })
}
export const getTel = (tel) => {
  return request({
    url: `/tenapi/tel/`,
    method: 'GET',
    params: {
      tel: tel
    }
  })
}
*/

export const getTelPost = (tel) => {
  return request({
    url: `/tenapi/tel/`,
    method: 'POST',
    data: {

    }
  })
}
