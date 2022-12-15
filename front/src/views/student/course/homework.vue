<template>
  <div>
    <!--    <a-table :columns="columns" :dataSource="dataSource">-->

    <!--      <template slot="operation">-->
    <!--        <a-button @click="entryWork(courseId)">提交作业</a-button>-->
    <!--      </template>-->

    <!--    </a-table>-->

    <a-table
      :columns="columns"
      :data-source="homeworkList"
    >
      <span slot="title" slot-scope="title">
        {{ title }}
      </span>
      <span slot="start_date" slot-scope="start_date">
        {{ start_date }}
      </span>
      <span slot="end_date" slot-scope="end_date">
        {{ end_date }}
      </span>
      <span slot="operation">
        <a-button type="primary" @click="entryWork(courseId)">
          提交作业
        </a-button>
      </span>
    </a-table>

  </div>
</template>

<script>
import { checkWork } from '@/api/homework'

export default {
  name: 'Homework',
  data () {
    const data = new Date()
    const year = data.getFullYear()
    const month = data.getMonth() + 1
    const day = data.getDate()
    return {
      dataSource: [
        {

          title: '第一次作业',
          endDate: year + '.' + month + '.' + (day + 3),
          startDate: year + '.' + month + '.' + day,
          operation: { customRender: 'operation' }
        },
        {

          title: '第二次作业',
          endDate: year + '.' + month + '.' + (day + 4),
          startDate: year + '.' + month + '.' + day,
          operation: { customRender: 'operation' }
        }
      ],

      columns: [
        {
          title: '标题',
          dataIndex: 'title',
          key: 'title'
        },
        {
          title: '开始时间',
          dataIndex: 'start_date',
          key: 'start_date'
        },
        {
          title: '截止时间',
          dataIndex: 'end_date',
          key: 'end_date'
        },
        {
          title: '操作',
          dataIndex: 'operation',
          key: 'operation',
          scopedSlots: { customRender: 'operation' }
        }
      ],
      courseId: this.$route.query['id'],
      homeworkList: []
    }
  },
  created () {
    console.log(this.courseId)
    this.checkWork()
  },
  methods: {
    checkWork () {
      checkWork(this.courseId).then((res) => {
        this.homeworkList = res.data
      })
    },
    entryWork (courseId) {
      this.$router.push({
        path: '/homework/pushHomework',
        query: {
          courseId
        }
      })
    }
  }
}

</script>

<style scoped>

</style>
