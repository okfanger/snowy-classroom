<template>
  <div>
    <a-table :columns="columns" :dataSource="dataSource">

      <template slot="operation" slot-scope="id"><a-button @click="entryWork(id)">提交作业</a-button></template>

    </a-table>

  </div>
</template>

<script>
export default {
  name: 'Homework',
  data () {
    const data = new Date()
    const year = data.getFullYear()
    const month = data.getMonth() + 1
    const day = data.getDate()
    return {
      dataSource: [
        {

          title: '第一次作业',
          endDate: year + '.' + month + '.' + (day + 3),
          startDate: year + '.' + month + '.' + day,
          operation: { customRender: 'operation' }
        },
        {

          title: '第二次作业',
          endDate: year + '.' + month + '.' + (day + 4),
          startDate: year + '.' + month + '.' + day,
          operation: { customRender: 'operation' }
        }
      ],

      columns: [
        {
          title: '标题',
          dataIndex: 'title',
          key: 'title'
        },
        {
          title: '开始时间',
          dataIndex: 'startDate',
          key: 'startDate'
        },
        {
          title: '截止时间',
          dataIndex: 'endDate',
          key: 'endDate'
        },
        {
          title: '操作',
          dataIndex: 'operation',
          key: 'operation',
          scopedSlots: { customRender: 'operation' }
        }
      ]
    }
  },
  methods: {
    entryWork () {
      this.$router.push({
        path: '/homework/pushHomework'
      })
    }
  }
}

</script>

<style scoped>

</style>
