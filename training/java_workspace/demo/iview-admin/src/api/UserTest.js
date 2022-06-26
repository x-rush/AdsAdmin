import axios from '@/libs/api.request'

export const getUserData = info => {
  return axios.request({
    url: 'city/getList',
    method: 'post',
    data: info
  })
}
