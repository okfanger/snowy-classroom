<template>
  <div>
    <a-table
      :columns="columns"
      :data-source="homeworkList"
      class="table"
    >
      <span slot="timu" slot-scope="title">
        {{ title }}
      </span>
      <span slot="start_date" slot-scope="start_time">
        {{ start_time }}
      </span>
      <span slot="end_date" slot-scope="end_time">
        {{ end_time }}
      </span>
      <span slot="operation" slot-scope="homework_id">
        <a-button type="primary" @click="entryWork(homework_id)">
          提交作业
        </a-button>
      </span>
    </a-table>
  </div>
</template>

<script>
import {checkWork} from '@/api/homework'

export default {
  name: 'Homework',
  data() {
    return {
      columns: [
        {
          title: '作业题目',
          dataIndex: 'title',
          key: 'timu',
          scopedSlots: {customRender: 'timu'}
        },
        {
          title: '开始时间',
          dataIndex: 'start_time',
          key: 'start_time',
          scopedSlots: {customRender: 'start_time'}
        },
        {
          title: '截止时间',
          dataIndex: 'end_time',
          key: 'end_time',
          scopedSlots: {customRender: 'end_time'}
        },
        {
          title: '操作',
          dataIndex: 'homework_id',
          key: 'operation',
          scopedSlots: {customRender: 'operation'}
        }
      ],
      courseId: this.$route.query['id'],
      homeworkList: [],
      homeworkId: 0
    }
  },
  created() {
    console.log(this.courseId)
    this.checkWork()
  },
  methods: {
    checkWork() {
      checkWork(this.courseId, this.homeworkId).then((res) => {
        this.homeworkList = res.data
        console.log(this.homeworkList)
      })
    },
    entryWork(homeworkId) {
      console.log(homeworkId)
      // this.$router.push({
      //   path: '/homework/pushHomework',
      //   query: {
      //     homeworkId
      //   }
      // })
      this.$router.push({
        path: '/homework/pushHomework',
        query: {
          courseId: this.courseId,
          homeworkId: homeworkId
        }
      })
    }
  }
}

</script>

<style scoped>

</style>
