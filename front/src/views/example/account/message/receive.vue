<template>
  <div>
    <div
      v-for="item in mail"
      :key="item.index"
      class="receive-div">
      <a-card class="receive-time-card">
        <span class="receive-time">{{ item.receive_date }}</span>
      </a-card>
      <a-card class="receive-title-card">
        <a @click="noticeActive(item.this_mail_id,item.is_read,item)">
          <h2 class="receive-card-h2">{{ item.title }}</h2>
        </a>
      </a-card>
      <a-card class="is_read_card">
        <span class="is_read_span" v-if="item.is_read === true">
          <img class="is_read_img" src="../../../../assets/innerMail/yes.png">
          已读
        </span>
        <span class="is_read_span" v-if="item.is_read === false">
          <img class="is_read_img" src="../../../../assets/innerMail/no.png">
          未读
        </span>
      </a-card>
    </div>
  </div>
</template>

<script>
import { mailNotice, ReceiveMail } from '@/api/innermail'

export default {
  name: 'Receive',
  created () {
    this.ReceiveMail()
  },
  data () {
    return {
      mail: {
        title: '',
        content: '',
        receive_date: '',
        from_user: '',
        is_read: '',
        this_mail_id: ''
      }
    }
  },

  methods: {
    ReceiveMail () {
      ReceiveMail().then((res) => {
        this.mail = res.data
        console.log(this.mail.length)
      })
    },

    noticeActive (mailId, isRead, thisMail) {
      console.log(mailId)
      if (isRead === false) {
        mailNotice(mailId)
      }
      this.$router.push({
        path: '/message/mailDetail',
        query: {
          mailId,
          thisMail
        }
      })
    }
  }
}

</script>

<style scoped>
.receive-div{
  width: 100%;
  height: auto;
  display: flex;
  margin-bottom: 20px;
}
.receive-title-card{
  width: 85%;
  height: 100px;
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
}
.receive-card-h2{
  font-size: 23px;
  font-weight: bold;
}
.receive-time-card{
  width: 15%;
  height: 100px;
  text-align: center;
  border-radius: 10px;
  margin-right: 10px;
}
.receive-time{
  font-size: 15px;
  font-weight: normal;
}
.is_read_card{
  height: 100px;
  width: 150px;
  float: right;
  display: table;
  text-align: center;
}
.is_read_img{
  height: 29px;
  width: 30px;
  display: table-cell;
  margin: 0 auto;
}
</style>
