<template>
  <div>
    <a-input-search
      class="main_search"
      placeholder="请输入要学生"
      enter-button
      v-model="searchMsg"
      @search="CheckStudents" />
    <a-button
      type="primary"
      style="margin-left: 30px"
      @click="PickMonitor(0)"
      v-if="monitor_id!==0"
    >
      重设班委
    </a-button>
    <div class="monitor_back">
      <a-table
        :columns="columns"
        :data-source="students"
        :pagination="pagination"
      >
        <span slot="id" slot-scope="id">
          {{ id }}
        </span>
        <span slot="name" slot-scope="name">
          {{ name }}
        </span>
        <div slot="monitor" slot-scope="monitor" style="width: 50px">
          <span v-if="monitor===monitor_id">
            <a-tag color="orange">
              班长
            </a-tag>
          </span>
        </div>
        <span slot="username" slot-scope="username">
          {{ username }}
        </span>
        <span slot="email" slot-scope="email">
          {{ email }}
        </span>
        <span slot="telephone" slot-scope="telephone">
          {{ telephone }}
        </span>
        <span slot="action" slot-scope="id">
          <a-button type="primary" @click="PickMonitor(id)" v-if="monitor_id===0">
            设为班委
          </a-button>
          <a-button type="primary" disabled v-else>
            设为班委
          </a-button>
        </span>
      </a-table>
    </div>
  </div>
</template>

<script>
import { CheckStudents, PickMonitor } from '@/api/classroom'
import { mapGetters } from 'vuex'

export default {
  name: 'PickMonitor',
  data () {
    return {
      students: [],
      monitor_id: '',
      pagination: {
        pageSize: 7
      },
      searchMsg: '',
      columns: [
        {
          title: 'ID',
          dataIndex: 'id',
          key: 'id',
          scopedSlots: { customRender: 'id' }
        },
        {
          title: '姓名',
          dataIndex: 'name',
          key: 'name',
          scopedSlots: { customRender: 'name' }
        },
        {
          title: '学号',
          dataIndex: 'username',
          key: 'username',
          scopedSlots: { customRender: 'username' }
        },
        {
          title: '邮箱',
          dataIndex: 'email',
          key: 'email',
          scopedSlots: { customRender: 'email' }
        },
        {
          title: '电话',
          dataIndex: 'telephone',
          key: 'telephone',
          scopedSlots: { customRender: 'telephone' }
        },
        {
          title: '备注',
          dataIndex: 'id',
          key: 'monitor',
          scopedSlots: { customRender: 'monitor' }
        },
        {
          title: '操作',
          dataIndex: 'id',
          key: 'action',
          scopedSlots: { customRender: 'action' }
        }
      ]
    }
  },
  created () {
    this.CheckStudents()
  },
  methods: {
    CheckStudents () {
      const searchMsg = this.searchMsg
      CheckStudents(searchMsg).then((res) => {
        console.log(searchMsg)
        this.students = res.data[0]
        this.monitor_id = res.data[1]
      })
    },
    PickMonitor (stuId) {
      PickMonitor(stuId).then(() => {
        this.CheckStudents()
      })
    }
  },
  computed: {
    ...mapGetters(['userInfo'])
  }
}
</script>

<style scoped>
.main_search {
  margin-left: 5%;
  width: 300px;
}
.monitor_back {
  width: 90%;
  margin: 0 auto;
  background: white;
}
</style>
