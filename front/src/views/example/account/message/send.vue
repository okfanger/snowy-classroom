<template>
  <div>
    <div class="send-back">
      <div class="send-div">
        <div class="send-p-div"><p class="send-p">收件人</p></div>
        <div class="send-input-div"><a-input class="send-input" placeholder="收件人" v-model="toUser"/></div>
      </div>
      <div class="send-div">
        <div class="send-p-div"><p class="send-p">主题</p></div>
        <div class="send-input-div"><a-input class="send-input" placeholder="主题" v-model="title"/></div>
      </div>
      <div class="send-div">
        <div class="send-p-div send-content"><p class="send-p">内容</p></div>
        <div class="send-input-div"><a-textarea placeholder="Basic usage" :rows="4" v-model="content" /></div>
      </div>
      <div class="send-button-div">
        <a-button class="send-button" type="primary" @click="SendMail">发送</a-button>
        <a-button class="send-button" @click="cancel">取消</a-button>
      </div>
    </div>
  </div>
</template>

<script>
import { SendMail } from '@/api/innermail'
import { mapGetters } from 'vuex'

export default {
  name: 'AccountMessage',
  data () {
    return {
      toUser: '',
      title: '',
      content: ''
    }
  },
  methods: {
    SendMail () {
      SendMail(this.toUser, this.title, this.content).then((res) => {
        this.$notification.open({
          message: res.data
        })
      })
    },
    cancel () {
      this.toUser = ''
      this.title = ''
      this.content = ''
    }
  },
  computed: {
    ...mapGetters(['userInfo'])
  }
}
</script>

<style scoped>
.send-back{
  width: 70%;
  height: 300px;
  background: white;
  margin: 0 auto;
}
.send-p-div{
  width: 50px;
  height: auto;
  display: inline-block;
  margin: 10px;
  text-align: justify;
  font-size: 16px;
  font-weight: bold;
  border-bottom: 3px gray;
}
.send-input-div{
  width: 90%;
  display: inline-block;
  margin: 10px;
}
.send-div{
  width: 900px;
  height: auto;
  margin: 0 auto;
    /*background: #47e894;*/
}
.send-button-div{
  text-align: center;
}
.send-button{
  margin: 0 5px 0px 5px;
}
</style>
