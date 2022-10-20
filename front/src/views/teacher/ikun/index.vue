<template>
  <div>
    <a-button type="danger" @click="handleRandomTeam">
      点我随机队伍 POST
    </a-button>
    <a-button type="danger" @click="handleRandTeamGet">
      点我随机队伍 GET
    </a-button>

    <br />
    <a-progress type="circle" :percent="visitUsPercent" />
    <a-input v-model="msg"></a-input>
    <a-button @click="callMissZhuang"></a-button>
  </div>
</template>

<script>
import { callMissZhuang, getRandomTeam, getRandomTeamGet, getVisitUsPercent } from '@/api/test-back'

export default {
  name: 'TeacherIkunIndex',
  data () {
    return {
      visitUsPercent: 0,
      msg: ''
    }
  },
  created () {
    // this.handleGetVisitUs()
  },
  methods: {
    callMissZhuang () {
      callMissZhuang(this.msg).then((res) => {
        console.log(res)
      })
    },
    handleGetVisitUs () {
      setInterval(() => {
        getVisitUsPercent().then((res) => {
          this.visitUsPercent = res.data.percent
        })
      }, 3000)
    },
    handleRandomTeam () {
      getRandomTeam().then((res) => {
        console.log(res)
      })
    },
    handleRandTeamGet () {
      getRandomTeamGet().then((res) => {
        console.log(res)
      })
    }
  }
}
</script>

<style scoped>

</style>
