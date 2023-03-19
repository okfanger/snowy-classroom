<template>
  <div>
    <div class="sign-in-bar">
      <a-space>
        <template v-if="attend_able">
          <a-button type="primary" @click="handleCreateAttendTask">
            创建考勤任务
          </a-button>
        </template>
        <template v-else>
          <a-button type="warning" @click="handleOpenDrawer">
            查看考勤结果
          </a-button>
        </template>
        <a-button v-show="!editDataVisible" @click="handleEditData">
          编辑考勤
        </a-button>
        <a-button v-show="editDataVisible" type="primary" @click="handleSaveData">
          保存
        </a-button>
      </a-space>
      <div style="height: 20px"></div>
    </div>

    <a-table
      :loading="dataLoading"
      bordered
      size="middle"

      :scroll="{x: scrollx}"
      :data-source="dataSource"
      :columns="columns"
      rowKey="studentId">
      <template slot="name" slot-scope="text, record">{{ studentMap[record.studentId] ? studentMap[record.studentId].user.name : "" }}</template>
      <template v-for="item in records" :slot="`scope${item.id}`" slot-scope="text, record">
        <span :key="`k1_${item.id}`" v-if="editDataVisible">
          <a-select @change="addUploadList" :style="{'width': '80px'}" v-model="record.records[item.id].result" :default-value="record.records[item.id].result" style="width: 120px">
            <a-select-option
              :data-record="record.records[item.id].id"
              :data-studentid="record.studentId"
              :data-taskid="record.records[item.id].task"
              :key="`k2_${item2.label}`"
              v-for="item2 in atStatusList"
              :value="item2.label">
              {{ item2.label }}
            </a-select-option>
          </a-select></span>
        <span :key="`k3_${item.id}`" v-if="!editDataVisible"> <a-tag
          :color="getColorByLabel(record.records[item.id].result)">
          {{ record.records[item.id].result }}
        </a-tag></span>
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
    <a-drawer
      title="签到情况"
      placement="right"
      :closable="false"
      :visible="drawerVisible"
      @close="onDrawerClose"
    >
      <p><a-button @click="refreshAsyncAttendTask">刷新数据</a-button></p>
      <img style="width: 100%" :src="qrcodeImgUrl" alt="">
      <a-timeline>
        <a-timeline-item :key="item.id" v-for="item in asyncAttendRecordCut">{{ studentMap[item.student].user.name }}
          {{ item.sign_in_time }}</a-timeline-item>
      </a-timeline>
    </a-drawer>
  </div>
</template>

<script>
import { getStudents, getTeacherOne } from '@/api/course'
import {
  attendUpdateBatch,
  createCourseAttendTask,
  getCourseAttendBeforeCreateStatus,
  getCourseAttendOneRecord,
  getCourseAttendRecord
} from '@/api/attend'
import { message } from 'ant-design-vue'
export default {
  name: 'Attend',
  props: {
    'courseId': {
      type: Number,
      default: -1
    }
  },
  computed: {
    scrollx () {
      const columns = this.columns

      let scrollx = 0
      for (let i = 0; i < columns.length; i++) {
        scrollx += 1
      }
      console.log(scrollx)
      return scrollx
    },
    asyncAttendRecordCut () {
      const dataset = this.asyncAttendRecord ? this.asyncAttendRecord.studentcourseattend_set : []
      if (dataset === undefined) { return [] }
      return dataset.filter((item) => {
        return item.result === '正常'
      })
    }
  },
data () {
    const atStatusList = [
        { label: '正常', value: 0, color: 'green' },
        { label: '请假', value: 1, color: 'blue' },
        { label: '缺勤', value: 2, color: 'red' }
      ]

  return {
    uploadList: {},
    qrcodeImgUrl: '',
    asyncAttendRecord: {},
    attend_expire_time: '',
    drawerVisible: false,
    atStatusList,
    dataLoading: true,
    editDataVisible: false,
    studentMap: {},
    columns: [],
    dataSource: [],
    attend_able: true,
    createAttendTaskForm: {
      duration: 1
      },
      teacher: {},
      createAttendTaskVisible: false,
      createAttendTaskconfirmLoading: false
    }
  },
  methods: {

    addUploadList (e, option) {
      const studentId = option.data.attrs['data-studentid']
      const taskId = option.data.attrs['data-taskid']
      const recordId = option.data.attrs['data-record']
      this.uploadList[`${taskId}-${studentId}`] = {
        student: studentId,
        task: taskId,
        id: recordId,
        result: e
      }

      console.log(this.uploadList)
    },
    getColorByLabel (label) {
      for (const item of this.atStatusList) {
        if (item.label === label) {
          return item.color
        }
      }
    },
    onDrawerClose () {
      this.drawerVisible = false
    },
    handleOpenDrawer () {
      // 获取当前页面地址，如http://localhost:8080/admin/index
      const wPath = window.document.location.href
      // 获取当前页面主机地址之后的目录，如：/admin/index
      const pathName = this.$route.path
      const pos = wPath.indexOf(pathName)
      // 获取主机地址，如：http://localhost:8080
      const localhostPath = wPath.substring(0, pos)
      const signInUrl = `${localhostPath}/user/sign-in/?task=${this.asyncAttendRecord.id}`
      this.qrcodeImgUrl = `${localhostPath}/api/qrcode/?url=${encodeURI(signInUrl)}`
      console.log(this.qrcodeImgUrl)
      this.drawerVisible = true
    },
    handleSaveData () {
      this.dataLoading = true

      attendUpdateBatch(Object.values(this.uploadList)).then((res) => {
        console.log(Object.values(this.uploadList))
        console.log(res.data)
        this.editDataVisible = false
        this.dataLoading = false
      })
    },
    handleEditData () {
      this.dataLoading = true
      this.uploadList = {}

      setTimeout(() => {
        this.editDataVisible = true
        this.dataLoading = false
      }, 100)
    },
    handleCreateAttendTask () {
      this.createAttendTaskVisible = true
    },
    refreshAsyncAttendTask () {
      getCourseAttendOneRecord(this.asyncAttendRecord.id).then((res) => {
        this.asyncAttendRecord = res.data
      })
    },
    handleCreateAttendTaskVisibleOK () {
      this.createAttendTaskconfirmLoading = true

      createCourseAttendTask({
        courseId: this.courseId,
        duration: this.createAttendTaskForm.duration
      }).then((res) => {
        this.asyncAttendRecord = res.data
        console.log(res.data)
          message({
            type: 'success',
            message: '创建成功，等待学生签到'
          })
          this.createAttendTaskVisible = false
          this.createAttendTaskconfirmLoading = false
      }).catch((fail) => {
        this.createAttendTaskVisible = false
        this.createAttendTaskconfirmLoading = false
      }).finally(() => {
        getCourseAttendBeforeCreateStatus(this.courseId).then((res) => {
          this.attend_able = res.data.attend_able
          this.attend_expire_time = res.data.expire_time
          this.asyncAttendRecord = res.data.task
        }).finally(() => {
          this.handleOpenDrawer()
        })
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
    this.studentMap = studentMap
  })

  getCourseAttendBeforeCreateStatus(this.courseId).then((res) => {
    this.attend_able = res.data.attend_able
    this.attend_expire_time = res.data.expire_time
    this.asyncAttendRecord = res.data.task
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
     const cols = [{
       key: 'name',
       title: '姓名',
       // dataIndex: 'studentId',
       width: 100,
       fixed: 'left',
       align: 'center',
       scopedSlots: { customRender: 'name' }
     }]

     for (const taskItem of res.data) {
       cols.push({
         key: taskItem['id'],
         title: taskItem['create_time'],
         width: '80px',
         align: 'center',
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
     console.log('col', cols)
     console.log('va', Object.values(processDict))
     this.dataSource = Object.values(processDict)
     this.columns = cols
     this.dataLoading = false
  })
  }
}
</script>

<style scoped>

</style>
