<template>
  <div>
    <a-table :columns="columns" :dataSource="dataSource">

      <template slot="operation">
        <a-button type="primary" @click="showModal">
          查看作业
        </a-button>
        <a-modal
          title="作业"
          :visible="visible"
          :confirm-loading="confirmLoading"
          @ok="handleCancel"
          @cancel="handleCancel"
        >
          <div>
            <a-card title="第一次作业" style="width:100%">
              <p>
                今天的作业是XXXXX，写完后提交到平台。
              </p>
              <p>
                今天的作业是XXXXX，写完后提交到平台。
              </p>
              <p>
                今天的作业是XXXXX，写完后提交到平台。
              </p>
              <p>
                今天的作业是XXXXX，写完后提交到平台。
              </p>
              <p>
                今天的作业是XXXXX，写完后提交到平台。
              </p>
            </a-card>

          </div>
        </a-modal>
        <div>
        </div></template>

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
    //  handleOk (e) {
    //   this.ModalText = 'The modal will be closed after two seconds'
    //   this.confirmLoading = true
    //   setTimeout(() => {
    //     this.visible = false
    //     this.confirmLoading = false
    //   }, 2000)
    // },
    handleCancel (e) {
      console.log('Clicked cancel button')
      this.visible = false
    },
    onChange (date, dateString) {
      console.log(date, dateString)
    }
  }
}

</script>

<style scoped>

</style>
