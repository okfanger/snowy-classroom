<template>
  <div>
    <div class="notice_back">
      <a-list
        class="notice_list"
        :data-source="notices"
      >
        <a-list-item slot="renderItem" slot-scope="item" style="padding: 0">
          <span class="notice_log_span">
            <img class="notice_log" src="../../../assets/notice/notice.png">
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
import { CheckNoticeAdmin } from '@/api/classroom'

export default {
  name: 'CheckNotice',
  data () {
    return {
      notices: [],
      loading: true,
      loadingMore: false,
      showLoadingMore: true,
      data: []
    }
  },
  created () {
    this.CheckNoticeAdmin()
  },
  methods: {
    go (thisNotice) {
      console.log(thisNotice)
      this.$router.push({
        path: '/classroom/checkNoticeDetail',
        query: {
          thisNotice
        }
      })
    },
    CheckNoticeAdmin () {
      CheckNoticeAdmin().then((res) => {
        this.notices = res.data
        console.log(this.notices)
      })
    }
  }
}
</script>

<style scoped>
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
