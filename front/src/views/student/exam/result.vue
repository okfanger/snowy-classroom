<template>
  <div>
    <a-result v-if="state === 404" status="404" title="404" sub-title="未找到该考试">
      <template #extra>
        <a-button type="primary" @click="$router.push('/')">
          返回主页
        </a-button>
      </template>
    </a-result>
    <div v-if="state === 202" style="height: 100%;text-align: center">
      <a-row type="flex" justify="center" align="middle" style="text-align: center; height: 100%; align-items: center">
        <a-descriptions :column="1" bordered :title="exam.name" >
          <a-descriptions-item label="考试名">
            {{ exam.name }}
          </a-descriptions-item>
          <a-descriptions-item label="开始时间">
            {{ moment(exam.start_time).format('YYYY-MM-DD HH:mm:ss') }}
          </a-descriptions-item>
          <a-descriptions-item label="结束时间">
            {{ moment(exam.end_time).format('YYYY-MM-DD HH:mm:ss') }}
          </a-descriptions-item>
          <a-descriptions-item label="状态">
            {{ dyState }}
          </a-descriptions-item>

        </a-descriptions>
      </a-row>
      <div style="height: 10px"></div>
      <a-button type="primary" v-show="dyState.includes('正在进行')" @click="handleStartExam">
        开始考试
      </a-button>

      <a-modal
        title="请仔细阅读诚信公约"
        :visible="roleModelVisible"
        :confirm-loading="roleModelconfirmLoading"
        @ok="handleRoleModelOk"
        @cancel="handleRoleModelCancel"
      >
        <p>{{ ruleText }}</p>
        <p style="font-weight: bold">点击确定后生成试卷</p>
      </a-modal>
    </div>
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
            <a-button type="primary" @click="handleSubmitExam">
              交卷
            </a-button>
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
    <div v-if="state === 203">
      <a-result status="200" title="交卷提示" sub-title="您已交卷，考试结果请在考试结束后查看">
        <template #extra>
          <a-button type="primary" @click="$router.push('/')">
            返回主页
          </a-button>
        </template>
      </a-result>
    </div>
  </div>
</template>

<script>
import {
  getExamDetailById,
  getExamStudentStateById,
  generateExamByExamId,
  sumbitQuestionRecordAsync,
  overExam
} from '@/api/exam'
import moment from 'moment'
import { calcState, ruleText } from '@/utils/custom'
export default {
  name: 'Questionnaire',
  data () {
    return {
      roleModelconfirmLoading: false,
      roleModelVisible: false,
      ruleText,
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
watch: {
    user_answer: {
      deep: true,
      handler (oldValue, newValue) {
        const up = Object.keys(newValue).length
        const down = this.exam.question_set.length
        this.total_percent = ((up / down) * 100).toFixed(2)
      }
    }
  },
methods: {
  handleRoleModelCancel () {
    this.roleModelVisible = false
    this.roleModelconfirmLoading = false
  },
handleRoleModelOk () {
    this.roleModelconfirmLoading = true
    generateExamByExamId(this.exam.id).then((res) => {
      // console.log(res.data)
      this.roleModelconfirmLoading = false
      this.initState()
    })
},
    handleSubmitExam () {
      overExam(this.attend_id).then((res) => {
        console.log('over', res.data)
        this.initState()
      })
    },
handleStartExam () {
    this.roleModelVisible = true
  },
initState () {
  const id = this.$route.query['id'] || undefined
    getExamStudentStateById(id).then((res) => {
      this.state = res.data['code']
      if (this.state === 201) {
        this.attend_id = res.data['attend_id']
        // console.log('attend', res.data['attend_id'])
      }
    })
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
  },
syncSubmit (item) {
    const itemId = item.id
    const ans = this.user_answer[itemId]
    this.user_spin[itemId] = true
  sumbitQuestionRecordAsync(itemId, ans, this.attend_id).then((res) => {
    console.log(res.data)
  }).finally(() => {
    this.user_spin[itemId] = false
  })

    // console.log(ans)
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
