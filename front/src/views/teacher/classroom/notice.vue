<template>
  <div>
    <div class="send-back">
      <a-form
        :form="form"
        :label-col="{ span: 5 }"
        :wrapper-col="{ span: 12 }"
        @submit="handleSubmit"
        class="send_mail_form"
      >
        <a-form-item label="选择班级">
          <a-select
            v-decorator="['course',{ rules: [{ required: true, message: '请选择班级' }] }]"
            placeholder="请选择班级">
            <a-select-option v-for="item in courses" :key="item">
              {{ item }}
            </a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item label="主题">
          <a-input
            v-decorator="['title', { rules: [{ required: true, message: '请输入主题' }] }]"
            placeholder="请输入主题" />
        </a-form-item>
        <a-form-item label="内容">
          <a-textarea
            v-decorator="['content', { rules: [{ required: true, message: '请输入内容' }] }]"
            :auto-size="{ minRows: 3, maxRows: 5 }"
            placeholder="请输入内容" />
        </a-form-item>
        <a-form-item :wrapper-col="{ span: 12, offset: 5 }">
          <a-button type="primary" html-type="submit" style="margin-right:40px;">
            发送
          </a-button>
        </a-form-item>
      </a-form>
    </div>
  </div>
</template>

<script>
import { publishNotice } from '@/api/classroom'
import { SendMail } from '@/api/innermail'

export default {
  name: 'Notice',
  data () {
    return {
      courses: [],
      form: this.$form.createForm(this, { name: 'coordinated' })
    }
  },
  created () {
    this.publishNotice()
  },
  methods: {
    handleSubmit (e) {
      e.preventDefault()
      this.form.validateFields((err, values) => {
        if (!err) {
          SendMail(values.course, values.title, values.content).then(() => {
            this.$message.success('发布成功')
            this.form.resetFields()
          })
        }
      })
    },
    publishNotice () {
      publishNotice().then((res) => {
        this.courses = res.data
        console.log(this.courses)
      })
    }
  }
}
</script>

<style scoped>
.send-back {
  width: 70%;
  min-height: 300px;
  overflow: auto;
  background: white;
  margin: 0 auto;
  padding-top: 20px;
}

.send_mail_form {
  margin-left: 80px;
}
</style>
