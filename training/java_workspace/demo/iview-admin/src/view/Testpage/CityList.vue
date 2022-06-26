<template>
  <div>
    <Form :model="pars" :inline=true>
      <FormItem label="name:" style="width:400px">
        <Input v-model="pars.name" style="width:300px" />
      </FormItem>
      <FormItem label="Country:" style="width:300px">
        <Select v-model="pars.countryCode" style="width:200px" :label-in-value=true @on-change="getdataByCountryChange">
          <Option v-for="item in countryList" :value="item.code" :key="item.code">{{ item.name }}</Option>
        </Select>
      </FormItem>
      <FormItem>
        <ButtonGroup>
          <Button type="primary" @click="getdata">search</Button>
        </ButtonGroup>
      </FormItem>
      <FormItem>
        <Table :columns="columns" :data="tableData" stripe border></Table>
        <Page :total="total" :current="pars.pageNum" :page-size="pars.pageSize" show-sizer @on-page-size-change="getdataByPageSizechange" @on-change="getdataByPagechange"/>
      </FormItem>
    </Form>
  </div>
</template>
<script>
import { getCityListData, getCountryListData } from '@/api/Test'
export default {
  data () {
    return {
      columns: [
        { title: 'ID', key: 'id' },
        { title: 'Name', key: 'name' },
        { title: 'CountryName', key: 'countrycode' },
        { title: 'District', key: 'district' },
        { title: 'Population', key: 'population' }
      ],
      tableData: [],
      pars: {
        name: '',
        countryCode: '',
        pageNum: 1,
        pageSize: 10
      },
      total: 10,
      countryList: []
    }
  },
  mounted () {
    this.getdata()
    this.initCountryList()
  },
  methods: {
    getdata () {
      getCityListData(this.pars).then(res => {
        this.tableData = res.data.tableList
        this.total = res.data.total
      })
    },
    getdataByPagechange: function (num) {
      this.pars.pageNum = num
      getCityListData(this.pars).then(res => {
        this.tableData = res.data.tableList
        this.total = res.data.total
      })
    },
    getdataByPageSizechange: function (size) {
      this.pars.pageSize = size
      getCityListData(this.pars).then(res => {
        this.tableData = res.data.tableList
        this.total = res.data.total
      })
    },
    initCountryList () {
      getCountryListData().then(res => {
        this.countryList = res.data.tableList
      })
    },
    getdataByCountryChange () {
      getCityListData(this.pars).then(res => {
        this.tableData = res.data.tableList
        this.total = res.data.total
      })
    }
  }
}
</script>
