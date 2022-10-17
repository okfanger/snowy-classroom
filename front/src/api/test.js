import request from 'axios'
export const getWeather = () => {
  return request({
    url: '/tenapi/yiyan/?format=json',
    method: 'GET',
    data: {

    }
  })
}
