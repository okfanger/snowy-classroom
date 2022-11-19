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
      <a-progress
        :stroke-color="{
          '0%': '#108ee9',
          '100%': '#87d068',
        }"
        :percent="total_percent"
      />
      <template v-for="item in exam.question_set">
        <a-card :key="item.id" size="small" :title="item.title" style="">
          <a slot="extra" href="#"><a-tag>{{ item.type }}</a-tag></a>
          <a-radio-group v-model="user_answer[`${item.id}`]">
            <a-radio style="display: block" v-for="item2 in item.options" :key="item2.id" :value="item2.id">
              {{ item2.content }}
            </a-radio>
          </a-radio-group>
        </a-card>
        <div :key="item.id" style="height: 20px"></div>
      </template>
    </div>
  </div>
</template>

<script>
import { getExamDetailById } from '@/api/exam'

export default {
  name: 'Questionnaire',
  data () {
    return {
      exam: {
        question_set: []

      },
      total_percent: 0,
      vaild: true,
      user_answer: {}
    }
  },
  created () {
    const id = this.$route.query['id'] || undefined
    if (!id) this.vaild = false
    else {
      getExamDetailById(id).then((res) => {
        this.exam = res.data
        for (const item of res.data.question_set) {
          this.user_answer[`${item.id$}`] = ''
        }
      })
    }
  }
}
</script>

<style scoped>

</style>
