<template>
  <div>
    <a-input-search
      class="notice_search"
      placeholder="请输入要搜索的邮件"
      enter-button
      v-model="searchMsg"
      @search="ReceiveMail" />
    <div class="mail_back">
      <a-list
        class="mail_list"
        :data-source="mail"
      >
        <a-list-item slot="renderItem" slot-scope="item" style="padding: 0">
          <span class="mail_log_span">
            <img class="mail_log" src="../../../../assets/notice/notice.png">
          </span>
          <div class="mail_list_item">
            <a-list-item-meta
              :description="item.receive_date">
              <a slot="title" @click="noticeActive(item.this_mail_id,item.is_read,item)">
                <h2 style="font-size: 23px;font-weight: bold;">
                  {{ item.title }}
                </h2>
              </a>
            </a-list-item-meta>
          </div>
          <a-divider type="vertical" style="height: 40px" />
          <div style="margin-right: 25px">
            <span class="is_read_span" v-if="item.is_read === true">
              <img class="is_read_img" src="../../../../assets/innerMail/yes.png">
              已读
            </span>
            <span class="is_read_span" v-if="item.is_read === false">
              <img class="is_read_img" src="../../../../assets/innerMail/no.png">
              未读
            </span>
          </div>
        </a-list-item>
      </a-list>
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
      mail: [],
      searchMsg: ''
    }
  },

  methods: {
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
    },
    ReceiveMail () {
      const searchMsg = this.searchMsg
      ReceiveMail(searchMsg).then((res) => {
          this.mail = res.data
          console.log(this.mail)
      })
    }
  }
}

</script>

<style scoped>
.notice_search {
  margin-left: 10%;
  width: 300px;
}
.mail_back {
  width: 80%;
  margin: 0 auto;
  background: white;
  overflow: auto;
}

.mail_list_item {
  margin: 15px 30px 15px 25px;
  width: 80%;
}

.is_read_img, .mail_log {
  height: 30px;
  width: 30px;
  display: table-cell;
  margin: 0 auto;
}

.mail_log_span {
  margin-left: 30px;
}
</style>
