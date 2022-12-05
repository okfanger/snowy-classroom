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
        <a-form-item label="收件人">
          <a-input
            v-decorator="['toUser', { rules: [{ required: true, message: '请输入收件人学号或工号' }] }]"
            placeholder="请输入收件人学号或工号"/>
        </a-form-item>
        <a-form-item label="主题">
          <a-input
            v-decorator="['title', { rules: [{ required: true, message: '请输入主题' }] }]"
            placeholder="请输入主题"/>
        </a-form-item>
        <a-form-item label="内容">
          <a-textarea
            v-decorator="['content', { rules: [{ required: true, message: '请输入内容' }] }]"
            :auto-size="{ minRows: 3, maxRows: 5 }"
            placeholder="请输入内容"/>
        </a-form-item>
        <a-form-item :wrapper-col="{ span: 12, offset: 5 }">
          <a-button type="primary" html-type="submit" style="margin-right:40px;">
            发送
          </a-button>
          <a-button type="danger" @click="cancel()">
            取消
          </a-button>
        </a-form-item>
      </a-form>
    </div>
  </div>
</template>

<script>
import { SendMail } from '@/api/innermail'
import { mapGetters } from 'vuex'

export default {
  name: 'Send',
  data () {
    return {
      toUser: '',
      title: '',
      content: '',
      form: this.$form.createForm(this, { name: 'coordinated' })
    }
  },

  methods: {
    handleSubmit (e) {
      e.preventDefault()
      this.form.validateFields((err, values) => {
        if (!err) {
          SendMail(values.toUser, values.title, values.content)
        }
        this.cancel()
      })
    },
    cancel () {
      this.toUser = ''
      this.title = ''
      this.content = ''
    }
  },
  computed: {
    ...mapGetters(['userInfo'])
  }
}
</script>

<style scoped>
.send-back{
  width: 70%;
  min-height:300px;
  overflow:auto;
  background: white;
  margin: 0 auto;
  padding-top: 20px;
}
.send_mail_form{
  margin-left: 80px;
}
</style>
