<template>
  <div>
    <div class="sign-in-bar">

      <template v-if="attend_able">
        <a-button type="primary" @click="handleCreateAttendTask">
          创建考勤任务
        </a-button>
      </template>
      <template v-else>
        <a-alert
          message="您现在正在进行一项考勤任务"
          description="请在考勤任务结束后再创建新的考勤任务"
          type="info"
          show-icon
        />
      </template>

    </div>
    <a-modal
      title="创建考勤任务"
      :visible="createAttendTaskVisible"
      :confirm-loading="createAttendTaskconfirmLoading"
      :form="createAttendTaskForm"
      @ok="handleCreateAttendTaskVisibleOK"
      @cancel="handleCreateAttendTaskCancel"
    >
      <a-form-item
        label="签到持续时间（单位：分钟）"
        prop="duration"
      >
        <a-row>
          <a-col :span="12">
            <a-slider v-model="createAttendTaskForm.duration" :min="1" :max="30" :step="0.5" />
          </a-col>
          <a-col :span="4">
            <a-input-number
              v-model="createAttendTaskForm.duration"
              :min="1"
              :max="30"
              :step="0.5"
              style="marginLeft: 16px"
            />
          </a-col>
        </a-row>

      </a-form-item>
    </a-modal>
  </div>
</template>

<script>
import { getTeacherOne } from '@/api/course'
import { createCourseAttendTask, getCourseAttendBeforeCreateStatus } from '@/api/attend'

export default {
  name: 'Attend',
  props: {
    'courseId': {
      type: Number,
      default: -1
    }
  },
data () {
  return {
    attend_able: true,
    createAttendTaskForm: {
        duartion: 1
      },
      teacher: {},
      createAttendTaskVisible: false,
      createAttendTaskconfirmLoading: false
    }
  },
  methods: {
    handleCreateAttendTask () {
      this.createAttendTaskVisible = true
    },
    handleCreateAttendTaskVisibleOK () {
      this.createAttendTaskconfirmLoading = true

      createCourseAttendTask({
        courseId: this.courseId,
        duration: this.createAttendTaskForm.duartion
      }).then((res) => {
          this.$message({
            type: 'success',
            message: '创建成功，等待学生签到'
          })
          this.createAttendTaskVisible = false
          this.createAttendTaskconfirmLoading = false
      }).catch((fail) => {
        this.createAttendTaskVisible = false
        this.createAttendTaskconfirmLoading = false
      })
    },
    handleCreateAttendTaskCancel () {
      this.createAttendTaskVisible = false
    }

  },
created () {
  getCourseAttendBeforeCreateStatus(this.courseId).then((res) => {
    this.attend_able = res.data
    console.log(res.data)
  })
  getTeacherOne(this.courseId).then((res) => {
    console.log(res.data)
    this.course = res.data
  })
  }
}
</script>

<style scoped>

</style>
