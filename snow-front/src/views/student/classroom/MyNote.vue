<template>
  <div>
    <a-date-picker
      @change="StuCheckLeave"
      class="note_search"
      v-model="searchTime"
      placeholder="请选择申请时间"
    />
    <div v-if="leave.length === 0">
      <a-empty/>
    </div>
    <div class="note_div" v-else>
      <a-descriptions class="note_descriptions" bordered v-for="(item,id) in this.leave" :key="id">
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
import {StuCheckLeave} from '@/api/classroom'
import {mapGetters} from 'vuex'
import moment from 'moment'

export default {
  name: 'MyLeave',
  data() {
    return {
      leave: [],
      searchTime: ''
    }
  },
  created() {
    this.StuCheckLeave()
  },
  methods: {
    StuCheckLeave() {
      const searchTime = moment(this.searchTime).format('YYYY-MM-DD')
      StuCheckLeave(searchTime).then((res) => {
        this.leave = res.data
      })
    }
  },
  computed: {
    ...mapGetters(['userInfo'])
  }
}
</script>

<style scoped>
.note_search {
  margin-left: 10%;
  width: 200px;
}

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
