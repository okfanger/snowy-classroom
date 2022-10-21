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
    <p>
      ====================================================================================================================</p>
    <a-progress
      :stroke-color="{
        '0%': '#108ee9',
        '100%': '#87d068',
      }"
      :percent="ikun_purity"
    />
    <a-input placeholder="身高" v-model="height" />
    <a-input placeholder="体重" v-model="weight" />
    <a-input placeholder="星座" v-model="constellation" />
    <a-input placeholder="血型" v-model="bloodType" />
    <a-input placeholder="爱好" v-model="hobby" />
    <a-button @click="testIkunPurity">测试坤度</a-button>
  </div>
</template>

<script>
import {
  callMissZhuang,
  getIkunPurity,
  getRandomTeam,
  getRandomTeamGet,
  getVisitUsPercent,
  testIkunPurity
} from '@/api/test-back'

export default {
  name: 'TeacherIkunIndex',
  data () {
    return {
      visitUsPercent: 0,
      ikun_purity: 0,
      msg: '',
      height: '',
      weight: '',
      constellation: '',
      bloodType: '',
      hobby: ''
    }
  },
  created () {
    // this.handleGetVisitUs()
    this.getIkunPurity()
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
    },

    getIkunPurity () {
      setInterval(() => {
        getIkunPurity().then((res) => {
          this.ikun_purity = res.data.ikun_purity
        })
      }, 1000)
    },
    testIkunPurity () {
      testIkunPurity(this.height, this.weight, this.constellation, this.bloodType, this.hobby).then((res) => {
        this.$notification.open({
          message: res.data
        })
      })
    }
  }
}
</script>

<style scoped>

</style>
