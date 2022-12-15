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
      <!--      <div>-->
      <!--        <a-input placeholder="输入作业题目" allow-clear @change="onChange" />-->
      <!--        <br />-->
      <!--        <br />-->
      <!--        <a-textarea placeholder="输入作业内容" allow-clear @change="onChange" />-->
      <!--        <br />-->
      <!--        <br />-->
      <!--        <a-range-picker @change="onChange" />-->
      <!--      </div>-->
      <a-form
        :form="form"
        :label-col="{ span: 5 }"
        :wrapper-col="{ span: 12 }"
        @submit="handleSubmit"
        class="leave_form"
      >
        <a-form-item label="作业题目">
          <a-input
            v-decorator="['title', { rules: [{ required: true, message: '请输入作业题目' }] }]"
            placeholder="请输入作业题目">
          </a-input>
        </a-form-item>
        <a-form-item label="作业内容">
          <a-input
            v-decorator="['content', { rules: [{ required: true, message: '请输入作业内容' }] }]"
            placeholder="请输入作业内容">
          </a-input>
        </a-form-item>
        <a-form-item label="开始时间">
          <a-date-picker
            :disabled-date="disabledDate"
            v-decorator="['start_time', { rules: [{ required: true, message: '请选择开始时间' }] }]"
            show-time
            format="YYYY-MM-DD HH:mm"
          />
        </a-form-item>
        <a-form-item label="结束时间">
          <a-date-picker
            :disabled-date="disabledDate"
            v-decorator="['end_time', { rules: [{ required: true, message: '请选择结束时间' }] }]"
            show-time
            format="YYYY-MM-DD HH:mm"
          />
        </a-form-item>
        <a-form-item :wrapper-col="{ span: 12, offset: 5 }">
          <a-button type="primary" html-type="submit">
            发布
          </a-button>
        </a-form-item>
      </a-form>
    </a-modal>
    <div>
      <a-table :columns="columns" :dataSource="dataSource">
        <template slot="operation" slot-scope="id"><a-button @click="delWork(id)">删除</a-button></template>
      </a-table>
    </div>
  </div>
</template>

<script>
import { releaseHomework } from '@/api/homework'

export default {
  name: 'SendHomework',
  data () {
    const data = new Date()
    const year = data.getFullYear()
    const month = data.getMonth() + 1
    const day = data.getDate()
    return {
      form: this.$form.createForm(this, { name: 'coordinated' }),
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
  created () {
    console.log(this.$route.query['key'])
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
  },
  handleSubmit (e) {
    e.preventDefault()
    this.form.validateFields((err, values) => {
      values.start_time = values['start_time'].format('YYYY-MM-DD HH:mm')
      values.end_time = values['end_time'].format('YYYY-MM-DD HH:mm')
      if (values.end_time > values.start_time) {
        if (!err) {
          releaseHomework(values.title, values.content, values.start_time, values.end_time).then(() => {
            this.$message.success('发布成功')
            this.form.resetFields()
          })
        }
      } else {
        this.$message.error('结束时间要在开始时间之后')
      }
    })
  }
  },
  delWork (id) {

  }
}
</script>

<style scoped>

</style>
