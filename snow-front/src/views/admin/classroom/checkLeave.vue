<template>
  <div>
    <div v-if="leaveList.length === 0">
      <a-empty/>
    </div>
    <div class="note_div" v-else>
      <a-descriptions class="note_descriptions" bordered v-for="(item,id) in this.leaveList" :key="id">
        <a-descriptions-item label="请假学生" :span="3">
          {{ item.name }}
        </a-descriptions-item>
        <a-descriptions-item label="请假课程">
          {{ item.course }}
        </a-descriptions-item>
        <a-descriptions-item label="请假类型" :span="2">
          {{ item.leave_type }}
        </a-descriptions-item>
        <a-descriptions-item label="开始时间">
          {{ item.start_time }}
        </a-descriptions-item>
        <a-descriptions-item label="结束时间" :span="2">
          {{ item.end_time }}
        </a-descriptions-item>
        <a-descriptions-item label="请假理由" :span="3">
          {{ item.reason }}
        </a-descriptions-item>
        <a-descriptions-item label="申请时间">
          {{ item.createTime }}
        </a-descriptions-item>
        <a-descriptions-item label="审批状态">
          <!-- status="success" 审批通过 -->
          <!-- status="warning" 正在审批 -->
          <a-badge v-if="item.status === 0" status="warning" text="正在审批"/>
          <a-badge v-if="item.status === 1" status="success" text="通过"/>
          <a-badge v-if="item.status === 2" status="error" text="未通过"/>
          <a-badge v-if="item.status === 3" status="default" text="已销假"/>
        </a-descriptions-item>
      </a-descriptions>
    </div>
  </div>
</template>

<script>
import {CheckLeaveAdmin} from '@/api/classroom'

export default {
  name: 'CheckLeave',
  data() {
    return {
      leaveList: [],
      searchTime: ''
    }
  },
  created() {
    this.CheckLeaveAdmin()
  },
  methods: {
    CheckLeaveAdmin() {
      CheckLeaveAdmin().then((res) => {
        this.leaveList = res.data
        console.log(this.leaveList)
      })
    }
  }
}
</script>

<style scoped>
.note_div {
  width: 80%;
  background: white;
  margin: 0 auto;
}

.note_descriptions {
  margin-bottom: 50px;
  background: #E0FFFF;
}
</style>
