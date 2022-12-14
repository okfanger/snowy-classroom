<template>
  <div>
    <div class="sign-in-bar">

      <template v-if="attend_able">
        <a-button type="primary" @click="handleCreateAttendTask">
          创建考勤任务
        </a-button>
      </template>
      <template v-else>
        <a-button type="primary" disabled>
          创建考勤任务
        </a-button>
      </template>

    </div>

    <a-table bordered :data-source="dataSource" :coumns="columns">

      <template v-for="item in records" :slot="`scope${item.id}`" slot-scope="text, record">
        {{ record.records[item.id] }}
      </template>
    </a-table>

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
import { getStudents, getTeacherOne } from '@/api/course'
import { createCourseAttendTask, getCourseAttendBeforeCreateStatus, getCourseAttendRecord } from '@/api/attend'

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
    columns: [],
    dataSource: [],
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
  getStudents(this.courseId).then((res) => {
    this.students = res.data
    const studentMap = {}
    this.students.forEach((student) => {
      studentMap[student.id] = student
    })
  })

  getCourseAttendBeforeCreateStatus(this.courseId).then((res) => {
    this.attend_able = res.data
    console.log(res.data)
  })
  getTeacherOne(this.courseId).then((res) => {
    console.log(res.data)
    this.course = res.data
  })

   getCourseAttendRecord(this.courseId).then((res) => {
    console.log('records', res.data)
     this.records = res.data
    // 对从数据库中获取的数据进行处理
    const processDict = {}
     const cols = []

     for (const taskItem of res.data) {
       cols.push({
         key: taskItem['id'],
         title: taskItem['craete_time'],
         scopedSlots: { customRender: `scope${taskItem['id']}` }
       })
        const attendRecord = taskItem.studentcourseattend_set
        for (const attendRecordItem of attendRecord) {
          const studentId = attendRecordItem['student']
          const id = attendRecordItem['id']
          const result = attendRecordItem['result']
          const signInTime = attendRecordItem['sign_in_time']
          const task = attendRecordItem['task']

          if (processDict[studentId] === undefined) {
            processDict[studentId] = {
              studentId: studentId,
              records: {}
            }
          }

          processDict[studentId].records[task] = ({
            student_id: studentId,
            id: id,
            result: result,
            sign_in_time: signInTime,
            task: task
          })
     }
     }
     // console.log('va', Object.values(processDict))
     this.dataSource = Object.values(processDict)
     this.columns = cols
  })
  }
}
</script>

<style scoped>

</style>
