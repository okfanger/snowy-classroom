<template>
  <div>
    <div class="monitor_back">
      <a-table
        :columns="columns"
        :data-source="monitor"
        class="table"
      >
        <span slot="name" slot-scope="name">
          {{ name }}
        </span>
        <span slot="remake">
          <a-tag color="orange">
            班长
          </a-tag>
        </span>
        <span slot="username" slot-scope="username">
          {{ username }}
        </span>
        <span slot="email" slot-scope="email">
          {{ email }}
        </span>
        <span slot="telephone" slot-scope="telephone">
          {{ telephone }}
        </span>
      </a-table>
    </div>
  </div>
</template>

<script>
import {CheckMonitorAdmin} from '@/api/classroom'

export default {
  name: 'CheckMonitor',
  data() {
    return {
      monitor: [],
      columns: [
        {
          title: '姓名',
          dataIndex: 'name',
          key: 'name',
          scopedSlots: {customRender: 'name'}
        },
        {
          title: '学号',
          dataIndex: 'username',
          key: 'username',
          scopedSlots: {customRender: 'username'}
        },
        {
          title: '邮箱',
          dataIndex: 'email',
          key: 'email',
          scopedSlots: {customRender: 'email'}
        },
        {
          title: '电话',
          dataIndex: 'telephone',
          key: 'telephone',
          scopedSlots: {customRender: 'telephone'}
        },
        {
          title: '备注',
          key: 'remake',
          scopedSlots: {customRender: 'remake'}
        }
      ]
    }
  },
  created() {
    this.CheckMonitorAdmin()
  },
  methods: {
    CheckMonitorAdmin() {
      CheckMonitorAdmin().then((res) => {
        this.monitor = res.data
      })
    }
  }
}
</script>

<style scoped>
.monitor_back {
  width: 90%;
  margin: 0 auto;
  background: #76EEC6;
}
</style>
