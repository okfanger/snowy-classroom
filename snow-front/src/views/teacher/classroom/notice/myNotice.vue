<template>
  <div>
    <a-input-search
      class="main_search"
      placeholder="请输入要搜索的公告"
      enter-button
      v-model="searchMsg"
      @search="CheckNotice" />
    <a-date-picker
      @change="CheckNotice"
      class="note_search"
      v-model="searchTime"
      placeholder="请选择申请时间"
    />
    <div class="notice_back">
      <a-list
        class="notice_list"
        :data-source="notices"
      >
        <a-list-item slot="renderItem" slot-scope="item" style="padding: 0">
          <span class="notice_log_span">
            <img class="notice_log" src="../../../../assets/notice/notice.png">
          </span>
          <div class="notice_list_item">
            <a-list-item-meta
              :description="item.send_date">
              <a slot="title" @click="go(item)">
                <h2 style="font-size: 23px;font-weight: bold;">
                  {{ item.title }}
                </h2>
              </a>
            </a-list-item-meta>
          </div>
        </a-list-item>
      </a-list>
    </div>
  </div>
</template>

<script>
import { CheckNotice } from '@/api/classroom'
import moment from 'moment/moment'

export default {
  name: 'MyNotice',
  data () {
    return {
      notices: [],
      loading: true,
      loadingMore: false,
      showLoadingMore: true,
      data: [],
      searchMsg: '',
      searchTime: ''
    }
  },
  created () {
    this.CheckNotice()
  },
  methods: {
    go (thisNotice) {
      console.log(thisNotice)
      this.$router.push({
        path: '/classroom/myNoticeDetail',
        query: {
          thisNotice
        }
      })
    },
    CheckNotice () {
      const searchMsg = this.searchMsg
      const searchTime = moment(this.searchTime).format('YYYY-MM-DD')
      CheckNotice(searchMsg, searchTime).then((res) => {
          this.notices = res.data
          console.log(this.notices)
      })
    }
  }
}
</script>

<style scoped>
.main_search {
  margin-left: 10%;
  width: 300px;
}
.notice_back{
  width: 80%;
  margin: 0 auto;
  background: white;
  overflow:auto;
}
.notice_list_item{
  margin: 15px 120px 15px 25px;
  width: 80%;
}
.notice_log{
  height: 30px;
  width: 30px;
  display: table-cell;
  margin: 0 auto;
}
.notice_log_span{
  margin-left:30px;
}
</style>
