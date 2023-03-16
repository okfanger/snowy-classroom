<template>
  <div>
    <div class="work_back">
      <a-list
        class="work_list"
        :data-source="homeworkList"
      >
        <a-list-item slot="renderItem" slot-scope="item" style="padding: 0">
          <div class="work_list_item">
            <a-list-item-meta
              :description="item.submit_time">
              <a slot="title" @click="noticeActive(item)">
                <h2 style="font-size: 23px;font-weight: bold;">
                  {{ item.homework_title }}
                </h2>
              </a>
              <p>{{ item.student }}</p>
            </a-list-item-meta>
          </div>
        </a-list-item>
      </a-list>
    </div>
  </div>
</template>

<script>
import {checkHomework} from '@/api/homework'
import {mapGetters} from 'vuex'

export default {
  name: 'Receive',
  created() {
    this.checkHomework()
  },
  data() {
    return {
      homeworkList: []
    }
  },

  methods: {
    noticeActive(thisHomework) {
      console.log(thisHomework)
      this.$router.push({
        path: '/homework/correctionDetail',
        query: {
          thisHomework
        }
      })
    },
    checkHomework() {
      checkHomework().then((res) => {
        this.homeworkList = res.data
        console.log(this.homeworkList)
      })
    }
  },
  computed: {
    ...mapGetters(['userInfo'])
  }
}

</script>

<style scoped>
.work_back {
  margin: 0 auto;
  background: white;
  overflow: auto;
}

.work_list_item {
  margin: 15px 30px 15px 25px;
  width: 80%;
}

.work_log {
  height: 30px;
  width: 30px;
  display: table-cell;
  margin: 0 auto;
}

.work_log_span {
  margin-left: 30px;
}
</style>
