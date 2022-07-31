<template>
  <div>
    <Form :model="pars">
      <FormItem label="name:">
        <Input v-model="pars.name" style="width:300px" />
      </FormItem>
    </Form>
    <ButtonGroup>
        <Button type="primary" @click="getdata">search</Button>
        <Button type="primary" @click="getdata">search</Button>
    </ButtonGroup>
    <br/><br/>
    <Table :columns="columns" :data="tableData" ></Table>
  </div>
</template>
<script>
import { getTableData } from '@/api/Test'
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
      getTableData(this.pars).then(res => {
        this.tableData = res.data.tableList
      })
    }
  }
}
</script>
