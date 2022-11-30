<template>
  <div>
    <a-page-header
      class="page-header"
      :title="mail.title"
      :sub-title="'发布时间 : '+mail.receive_date"
      @back="() => this.$router.go(-1)"
    />
    <div class="detail_back">
      <div class="detail_top">
        <h2 class="detail_title">{{ mail.title }}</h2>
        <p class="detail_p">
          <spqn class="detail_span">发件者 :&nbsp;</spqn>
          {{ mail.from_user }}
        </p>
        <p class="detail_p">
          <spqn class="detail_span">发件时间 :&nbsp;</spqn>
          {{ mail.receive_date }}
        </p>
      </div>
      <div class="detail_content_box">
        <div class="detail_content">{{ mail.content }}</div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'ReceiveDetail',
  data () {
    return {
      mail: {
        title: '',
        content: '',
        receive_date: '',
        from_user: ''
      }
    }
  },
  created () {
    this.mail = this.$route.query['thisMail']
  }
}

</script>

<style scoped>
.page-header{
  border-bottom: 1px solid rgb(207, 207, 207);
  background: #f8f8f8;
}
.detail_back{
  background: #f8f8f8;

  text-align: left;
}
.detail_top{
  width: 800px;
  margin: 0 auto;
}
.detail_title{
  font-size: 20px;
  line-height: 22px;
  font-weight: 600;
  color: #333;
  padding-top: 20px;
  margin-bottom: 20px;
}
.detail_span{
  color: #9b9b9b;
  display: inline-block;
  width: 100px;
  text-align: justify;
  text-align-last: justify;
}
.detail_content_box{
  height: 500px;
  margin: 0 auto;
  padding: 20px 0;
  text-align: left;
  word-break: break-word;
  background: white;
}
.detail_content{
  width: 800px;
  margin: 0 auto;
  font-size: 14px;
  line-height: 22px;
  color: #666;
  white-space: pre-wrap;
}
</style>
