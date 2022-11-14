<template>
  <div>
    <div style="height: 10px"></div>
    <a-table :columns="columns" :data-source="memberList">

    </a-table>
  </div>
</template>

<script>
import { getStudents } from '@/api/course'
import moment from 'moment'
export default {
  props: {
    'courseId': {
      type: Number,
      default: -1
    }
  },
  data () {
    return {
      moment,
      memberList: [],
      searchText: '',
      searchInput: null,
      searchedColumn: '',
      columns: [
        {
          title: '学号',
          dataIndex: 'user.username',
          key: 'user.username'
        },
        {
          title: '姓名',
          dataIndex: 'user.name',
          key: 'user.name'
        },
        {
          title: '班级',
          dataIndex: 'classroom',
          key: 'classroom',
          scopedSlots: { customRender: 'classroom' }
        },
        {
          title: '年级',
          dataIndex: 'grade',
          key: 'grade',
          scopedSlots: { customRender: 'grade' }
        }, {
          title: '邮箱',
          dataIndex: 'user.email',
          key: 'user.email',
          scopedSlots: { customRender: 'email' }
        },
        {
          title: '操作',
          dataIndex: 'action',
          key: 'action',
          scopedSlots: { customRender: 'action' }
        }
      ]
    }
  },
  created () {
    this.fetchData()
  },
  methods: {
    fetchData () {
      getStudents(this.courseId).then((res) => {
        this.memberList = res.data
        console.log(res)
      })
    }
  }
}
</script>
<style scoped>

</style>
