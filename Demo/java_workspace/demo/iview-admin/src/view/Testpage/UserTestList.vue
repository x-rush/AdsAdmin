<template>
  <div>
    <Form :model="pars">
      <FormItem label="name:">
        <Input v-model="pars.name" style="width:300px" />
      </FormItem>
    </Form>
    <Button type="primary" @click="getdata">Search</Button>
    <Table :columns="columns" :data="tableData" ></Table>
  </div>
</template>
<script>
import { getUserData } from '@/api/UserTest'
export default {
  data () {
    return {
      columns: [
        { title: 'id', key: 'id' },
        { title: 'name', key: 'name' }
      ],
      tableData: [],
      pars: {
        name: ''
      }
    }
  },
  mounted () {
    this.getdata()
  },
  methods: {
    getdata () {
      getUserData(this.pars).then(res => {
        this.tableData = res.data.tableList
      })
    }
  }
}
</script>
