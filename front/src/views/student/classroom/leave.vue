<template>
  <div>
    <div class="leave_back">
      <a-form
        :form="form"
        :label-col="{ span: 5 }"
        :wrapper-col="{ span: 12 }"
        @submit="handleSubmit"
        class="leave_form"
      >
        <a-form-item label="请假课程">
          <a-select
            v-decorator="['course',{ rules: [{ required: true, message: '请选择课程' }] }]"
            placeholder="请选择课程">
            <a-select-option v-for="item in all_course" :key="item">
              {{ item }}
            </a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item label="请假类型">
          <a-select
            v-decorator="['leave_type',{ rules: [{ required: true, message: '请选择请假类型' }] }]"
            placeholder="请选择请假类型">
            <a-select-option value="病假">
              病假
            </a-select-option>
            <a-select-option value="事假">
              事假
            </a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item label="请假理由">
          <a-input
            v-decorator="['reason', { rules: [{ required: true, message: '请输入请假理由' }] }]"
            placeholder="请输入请假理由">
          </a-input>
        </a-form-item>
        <a-form-item label="开始时间">
          <a-date-picker
            v-decorator="['start_time', { rules: [{ required: true, message: '请选择开始时间' }] }]"
            show-time
            format="YYYY-MM-DD HH:mm"
          />
        </a-form-item>
        <a-form-item label="结束时间">
          <a-date-picker
            v-decorator="['end_time', { rules: [{ required: true, message: '请选择结束时间' }] }]"
            show-time
            format="YYYY-MM-DD HH:mm"
          />
        </a-form-item>
        <a-form-item :wrapper-col="{ span: 12, offset: 5 }">
          <a-button type="primary" html-type="submit">
            申请
          </a-button>
        </a-form-item>
      </a-form>
    </div>
  </div>
</template>

<script>
import { getAllCourse, StudentLeave } from '@/api/classroom'

export default {
  name: 'Leave',
  data () {
    return {
      all_course: [],
      form: this.$form.createForm(this, { name: 'coordinated' })
    }
  },
  created () {
    if (this.all_course === null || this.all_course.length === 0) {
      this.getAllCourse()
    } else {
      console.log(this.all_course)
    }
  },
  methods: {
    handleSubmit (e) {
      e.preventDefault()
      this.form.validateFields((err, values) => {
        values.start_time = values['start_time'].format('YYYY-MM-DD HH:mm')
        values.end_time = values['end_time'].format('YYYY-MM-DD HH:mm')
        if (values.end_time > values.start_time) {
          if (!err) {
            console.log('Received values of form: ', values)
            StudentLeave(values.student, values.course, values.leave_type, values.reason,
              values.start_time, values.end_time).then(() => {
              this.$message.success('申请成功')
              this.form.resetFields()
            })
          }
        } else {
          this.$message.error('结束时间要在开始时间之后')
        }
      })
    },
    getAllCourse () {
      getAllCourse().then((res) => {
        this.all_course = res.data
      })
    }
  }

}
</script>

<style scoped>
.leave_form {
  width: 80%;
  background: white;
  margin: 0 auto;
}

a-form-item {
  width: 100%;
}
</style>
