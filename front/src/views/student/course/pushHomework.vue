<template>
  <div>
    <a-page-header
      class="page-header"
      title="返回"
      @back="() => this.$router.go(-1)"
    />
    <div class="detail_back">
      <div class="detail_top">
        <h2 class="detail_title">{{ homework.title }}</h2>
        <p class="detail_p">
          <span class="detail_span">开始时间 :&nbsp;</span>
          {{ homework.start_time }}
        </p>
        <p class="detail_p">
          <span class="detail_span">结束时间 :&nbsp;</span>
          {{ homework.end_time }}
        </p>
      </div>
      <div class="detail_content_box">
        <div class="detail_content">{{ homework.content }}</div>
      </div>
      <div>
        <p>请输入答案：</p>
        <a-textarea v-model="submitDetail" placeholder="请输入内容" :rows="4" />
      </div>
      <div>
        <a-button @click="submitWork(homeworkId, courseId, submitDetail)">提交</a-button>
      </div>
    </div>
  </div>
</template>

<script>
import { checkWork, submitWork } from '@/api/homework'

export default {
  name: 'PushHomework',
  data () {
    return {
      courseId: '',
      homeworkId: '',
      submitDetail: '',
      homework: []
    }
  },
  created () {
    this.homeworkId = this.$route.query['homeworkId']
    this.courseId = this.$route.query['courseId']
    console.log()
    this.checkWork(this.homeworkId, this.courseId)
  },
  methods: {
    checkWork () {
      checkWork(this.courseId, this.homeworkId).then((res) => {
        this.homework = res.data[0]
      })
    },
    submitWork (homeworkId, courseId, submitDetail) {
      submitWork(homeworkId, courseId, submitDetail).then(() => {
        this.$message.success('提交成功')
        this.$router.go(-1)
      })
      console.log(homeworkId, courseId, submitDetail)
    }
  }
}
</script>

<style scoped>
div {
  margin: 10px;
  padding-left: 100px;
  padding-right: 100px;
}
</style>
