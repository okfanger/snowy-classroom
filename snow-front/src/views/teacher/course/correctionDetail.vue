<template>
  <div>
    <div v-if="valid">
      <a-page-header
        class="page-header"
        :sub-title="'提交时间 : '+ homework.submit_time"
        @back="() => this.$router.go(-1)"
      />
      <div class="detail_back">
        <div class="detail_top">
          <h2 class="detail_title">{{ homework.title }}</h2>
          <p class="detail_p">
            <span class="detail_span">提交同学 :&nbsp; {{ }}</span>
            {{ homework.student }}
          </p>
          <p class="detail_p">
            <span class="detail_span">提交时间 :&nbsp;</span>
            {{ homework.submit_time }}
          </p>
        </div>
        <div class="detail_content_box">
          <div class="detail_content">{{ homework.submit_detail }}</div>
        </div>
      </div>
    </div>
    <div v-else>

      <a-result status="404" title="404" sub-title="作业未找到">
        <template #extra>
          <a-button type="primary">
            Back Home
          </a-button>
        </template>
      </a-result>
    </div>
  </div>
</template>

<script>

export default {
  name: 'CorrectionDetail',
  data() {
    return {
      valid: true,
      homework: []
    }
  },
  created() {
    this.homework = this.$route.query['thisHomework']
  }
}

</script>

<style scoped>
.page-header {
  border-bottom: 1px solid rgb(207, 207, 207);
  background: #f8f8f8;
  margin-left: 150px;
  margin-right: 150px;
}

.detail_back {
  background: #F5F5F5;
  margin-left: 150px;
  margin-right: 150px;
  text-align: left;
}

.detail_top {
  width: 800px;
  margin: 0 auto;
}

.detail_title {
  font-size: 20px;
  line-height: 22px;
  font-weight: 600;
  color: #333;
  padding-top: 20px;
  margin-bottom: 20px;
}

.detail_span {
  color: #9b9b9b;
  display: inline-block;
  width: 100px;
  text-align: justify;
  text-align-last: justify;
}

.detail_content_box {
  height: 500px;
  margin: 0 auto;
  padding: 20px 0;
  text-align: left;
  word-break: break-word;
  background: white;
  width: 70%;
}

.detail_content {
  width: 800px;
  margin: 0 auto;
  font-size: 14px;
  line-height: 22px;
  color: #666;
  white-space: pre-wrap;
}

.detail_p {
  margin-left: 85px;
}
</style>
