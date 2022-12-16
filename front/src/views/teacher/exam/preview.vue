<template>
  <div>
    <a-result v-if="state === 404" status="404" title="404" sub-title="未找到该考试">
      <template #extra>
        <a-button type="primary" @click="$router.push('/')">
          返回主页
        </a-button>
      </template>
    </a-result>
    <div v-if="state === 201" >
      <a-spin tip="Loading..." :spinning="spinning">
        <a-row type="flex" justify="space-around" align="middle" style="height: 100%">
          <a-col :sm="24" :md="6" align="center">
            <a-progress
              type="circle"
              :stroke-color="{
                '0%': '#108ee9',
                '100%': '#87d068',
              }"
              :percent="total_percent"
            />
            <div style="height: 20px"></div>
            <a-descriptions :column="1" bordered :title="exam.name" >
              <a-descriptions-item label="考试名">
                {{ exam.name }}
              </a-descriptions-item>

              <a-descriptions-item label="状态">
                {{ dyState }}
              </a-descriptions-item>

            </a-descriptions>
            <div style="height: 10px"></div>
          </a-col>
          <a-col :sm="24" :md="16" :style="{ height: `${clientHeight - 180}px`, overflow: 'scroll'}">
            <template v-for="(item, idx1) in exam.question_set">
              <a-spin :key="item.id" :spinning="user_spin[`${item.id}`] || false">
                <a-card :key="item.id" size="small" :title="`${idx1 + 1}. ${item.title}`" style="">
                  <a slot="extra" href="#"><a-tag>{{ item.type }}</a-tag></a>
                  <a-radio-group @change="syncSubmit(item)" v-model="user_answer[`${item.id}`]">
                    <a-radio style="display: block" v-for="(item2, idx2) in item.options" :key="item2.id" :value="item2.id">
                      {{ String.fromCharCode(idx2 + 'A'.charCodeAt()) }}: {{ item2.content }}
                    </a-radio>
                  </a-radio-group>

                </a-card>
              </a-spin>
              <div :key="item.id" style="height: 20px"></div>
            </template>
          </a-col>
        </a-row>
      </a-spin>
    </div>
  </div>
</template>

<script>
import {
  getExamDetailById
} from '@/api/exam'
import moment from 'moment'
import { calcState } from '@/utils/custom'
export default {
  name: 'ExamPreview',
  data () {
    return {
      spinning: true,
      dyState: '',
      calcState,
      moment,
      exam: {
        question_set: [],
        name: '未知考试'
      },
      clientHeight: 600,
      total_percent: 0,
      state: 404,
      user_answer: {},
      user_spin: {},
      attend_id: null
    }
  },
  methods: {

    initState () {
      const id = this.$route.query['id'] || undefined
      getExamDetailById(id).then((res) => {
        this.exam = res.data
        this.dyState = calcState(this.exam.start_time, this.exam.end_time)
        console.log(res.data)
      }).then(() => {
        this.interval = setInterval(() => {
          this.dyState = calcState(this.exam.start_time, this.exam.end_time)
          // console.log('update')x
        }, 1000)
      }).finally(() => {
        this.spinning = false
      })
    }
  },
  created () {
    this.clientHeight = document.body.clientHeight
    const id = this.$route.query['id'] || undefined
    if (!id) this.state = 404
    else {
      this.initState()
    }
  }

}
</script>

<style scoped>

</style>
