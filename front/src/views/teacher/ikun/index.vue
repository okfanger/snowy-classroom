<template>
  <div>
    <a-card :title="'今天是'+History.day" style="width: 300px">
      <a slot="extra" href="#">more</a>
      <p style="color: #00A0E9">在历史上的今天发生了:</p>
      <p v-for="val in History.content" :key="val">{{ val }}</p>
    </a-card>
  </div>
</template>

<script>
import { getHistory } from '@/api/test'

export default {
  name: 'TeacherIkunIndex',
  data () {
    return {
      History: undefined
    }
  },
  created () {
    getHistory().then((res) => {
      const History = res.data
      console.log('历史上的今天：', History)
      this.History = History
    })
  }
}
</script>

<style scoped>

</style>
