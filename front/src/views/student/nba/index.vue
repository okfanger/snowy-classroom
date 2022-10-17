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

  </div>

</template>

<script>
import { getWeather } from '@/api/test'
export default {
  name: 'StudentNBAIndex',
  data () {
    return {
      oneSentence: undefined
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
