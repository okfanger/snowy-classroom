<template>
  <div>
    <a-button type="primary" @click="showModal">
      发布作业
    </a-button>
    <a-modal
      title="作业"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="handleOk"
      @cancel="handleCancel"
    >
      <div>
        <a-input placeholder="输入作业题目" allow-clear @change="onChange" />
        <br />
        <br />
        <a-textarea placeholder="输入作业内容" allow-clear @change="onChange" />
        <br />
        <br />
        <a-range-picker @change="onChange" />
      </div>
    </a-modal>
    <div>
      <a-table :columns="columns" :dataSource="dataSource">
        <template slot="operation" slot-scope="id"><a-button @click="delWork(id)">删除</a-button></template>
      </a-table>

    </div>
  </div>
</template>

<script>
export default {
  name: 'SendHomework',
  data () {
    const data = new Date()
    const year = data.getFullYear()
    const month = data.getMonth() + 1
    const day = data.getDate()
    return {
      visible: false,
      confirmLoading: false,
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
    showModal () {
      this.visible = true
    },
    handleOk (e) {
      this.ModalText = 'The modal will be closed after two seconds'
      this.confirmLoading = true
      setTimeout(() => {
        this.visible = false
        this.confirmLoading = false
      }, 2000)
    },
    handleCancel (e) {
      console.log('Clicked cancel button')
      this.visible = false
    },
  onChange (date, dateString) {
    console.log(date, dateString)
  }
  },
  delWork (id) {

  }
}
</script>

<style scoped>

</style>
