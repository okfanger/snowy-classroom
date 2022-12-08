<template>
  <div>
    <a-date-picker
      @change="TeaCheckLeave"
      class="note_search"
      v-model="searchTime"
      placeholder="请选择申请时间"
    />
    <div>
      <a-empty v-show="stu_leave.length === 0"/>
    </div>
    <div class="note_div">
      <a-descriptions class="note_descriptions" bordered v-for="(item,id) in this.stu_leave" :key="id">
        <a-descriptions-item label="请假学生" :span="3">
          {{ item.name }}
        </a-descriptions-item>
        <a-descriptions-item label="请假课程">
          {{ item.course }}
        </a-descriptions-item>
        <a-descriptions-item label="请假类型" :span="2">
          {{ item.leave_type }}
        </a-descriptions-item>
        <a-descriptions-item label="请假理由" :span="3">
          {{ item.reason }}
        </a-descriptions-item>
        <a-descriptions-item label="开始时间">
          {{ item.start_time }}
        </a-descriptions-item>
        <a-descriptions-item label="结束时间" :span="2">
          {{ item.end_time }}
        </a-descriptions-item>
        <a-descriptions-item label="申请时间">
          {{ item.createTime }}
        </a-descriptions-item>
        <a-descriptions-item label="审批" v-if="item.status === 0" :span="2">
          <div class="des_btn_div">
            <a-button type="primary" @click="TeacherApproval(item.id,1)" block>
              同意
            </a-button>
          </div>
          <div class="des_btn_div">
            <a-button type="danger" @click="TeacherApproval(item.id,2)" block>
              不同意
            </a-button>
          </div>
        </a-descriptions-item>
        <a-descriptions-item label="审批状态" v-else :span="2">
          <!-- status="success" 通过 -->
          <!-- status="warning" 正在审批 -->
          <!-- status="error" 未通过 -->
          <div class="des_bag_div">
            <a-badge v-if="item.status === 1" status="success" text="通过" />
            <a-badge v-if="item.status === 2" status="error" text="未通过" />
            <a-badge v-if="item.status === 3" status="default" text="已销假" />
          </div>
          <div class="des_btn_div">
            <a-button type="primary" @click="TeacherApproval(item.id,3)" v-if="item.status !== 3" block>
              销假
            </a-button>
          </div>
        </a-descriptions-item>
      </a-descriptions>
    </div>
  </div>
</template>

<script>
import { TeaCheckLeave, TeacherApproval } from '@/api/classroom'
import moment from 'moment/moment'

export default {
  name: 'Approval',
  created () {
    this.TeaCheckLeave()
  },
  data () {
    return {
      stu_leave: {
        id: '',
        name: '',
        course: '',
        leave_type: '',
        start_time: '',
        end_time: '',
        reason: '',
        status: '',
        createTime: ''
      },
      searchTime: ''
    }
  },

  methods: {
    TeaCheckLeave () {
      const searchTime = moment(this.searchTime).format('YYYY-MM-DD')
      TeaCheckLeave(searchTime).then((res) => {
        this.stu_leave = res.data
        console.log(res.data)
      })
    },
    TeacherApproval (leaveId, status) {
      TeacherApproval(leaveId, status).then(() => {
        this.$message.success('操作成功')
      })
      this.TeaCheckLeave()
    }
  }
}

</script>

<style scoped>
.note_search {
  margin-left: 10%;
  width: 200px;
}
.note_div{
  width: 80%;
  background: white;
  margin: 0 auto;
}
.note_descriptions{
  margin-bottom: 50px;
  background: #E0FFFF;
  padding-right: -50px;
}
.des_btn_div{
  width: 80px;
  display: inline-block;
}
.des_bag_div{
  width: 80px;
  display: inline-block;
}
</style>
