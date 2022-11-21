<template>
  <div>
    <a-result v-if="!vaild" status="404" title="404" sub-title="未找到该考试">
      <template #extra>
        <a-button type="primary" @click="$router.push('/')">
          返回主页
        </a-button>
      </template>
    </a-result>

    <div v-else >

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

        </a-col>
        <a-col :sm="24" :md="16" :style="{ height: `${clientHeight - 180}px`, overflow: 'scroll'}">

          <template v-for="(item, idx1) in exam.question_set">
            <a-card :key="item.id" size="small" :title="`${idx1 + 1}. ${item.title}`" style="">
              <a slot="extra" href="#"><a-tag>{{ item.type }}</a-tag></a>
              <a-radio-group v-model="user_answer[`${item.id}`]">
                <a-radio style="display: block" v-for="(item2, idx2) in item.options" :key="item2.id" :value="item2.id">
                  {{ String.fromCharCode(idx2 + 'A'.charCodeAt()) }}: {{ item2.content }}
                </a-radio>
              </a-radio-group>
            </a-card>
            <div :key="item.id" style="height: 20px"></div>
          </template>
        </a-col>
      </a-row>
    </div>
  </div>
</template>

<script>
import { getExamDetailById } from '@/api/exam'
import moment from 'moment'
import { calcState } from '@/utils/custom'
export default {
  name: 'Questionnaire',
  data () {
    return {
      dyState: '',
      calcState,
      moment,
      exam: {
        question_set: [],
        name: '未知考试'
      },
      clientHeight: 600,
      total_percent: 0,
      vaild: true,
      user_answer: {}
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
  created () {
    this.clientHeight = document.body.clientHeight
    const id = this.$route.query['id'] || undefined
    if (!id) this.vaild = false
    else {
      getExamDetailById(id).then((res) => {
        this.exam = res.data
        console.log(res.data)
      }).then(() => {
        this.interval = setInterval(() => {
          this.dyState = calcState(this.exam.start_time, this.exam.end_time)
          console.log('update')
        }, 1000)
      })
    }
  }

}
</script>

<style scoped>

</style>
