<template>
  <div>
    <a-popover :title="oneSentence.author">
      <template slot="content">
        {{ oneSentence.hitokoto }}
        <a-tag color="blue">
          {{ oneSentence.catname }}
        </a-tag>
      </template>
      <a-button type="primary">
        {{ oneSentence.source }}
      </a-button>
    </a-popover>
    <a-button type="danger" @click="handleRandomTeam">
      点我随机队伍 POST
    </a-button>
    <a-button type="danger" @click="handleRandTeamGet">
      点我随机队伍 GET
    </a-button>
  </div>

</template>

<script>
import { getWeather } from '@/api/test'
import { getRandomTeam, getRandomTeamGet } from '@/api/test-back'
export default {
  name: 'StudentNBAIndex',
  data () {
    return {
      oneSentence: {
        hitokoto: '',
        catname: '',
        source: ''
      }
    }
  },
methods: {
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
  },
  created () {
    getWeather().then((res) => {
      const oneSentence = res.data
      console.log(oneSentence)
      this.oneSentence = oneSentence
    })
  }
}
</script>

<style scoped>

</style>
