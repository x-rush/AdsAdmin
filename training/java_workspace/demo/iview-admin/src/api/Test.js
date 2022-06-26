import axios from '@/libs/api.request'

export const getTableData = info => {
  return axios.request({
    url: 'user/getList',
    method: 'post',
    data: info
  })
}

export const getCityListData = info => {
  return axios.request({
    url: 'city/getCityList',
    method: 'post',
    data: info
  })
}

export const getCountryListData = () => {
  return axios.request({
    url: 'country/getCountryList',
    method: 'post'
  })
}
