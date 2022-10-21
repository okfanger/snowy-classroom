<template>
  <!--
  <div>
    <div style="background:#ECECEC; padding:30px">
      <a-card title="历史上的今天" :bordered="false" style="width: 500px">
        {{ history }}
      </a-card>
    </div>
    <div>
      <a-input v-model="telephone"></a-input>
      <a-button @click="fetchTel">查询归属地</a-button>
      <a-descriptions
        title="手机号归属地查询"
        bordered
        :column="{ xxl: 4, xl: 3, lg: 3, md: 3, sm: 2, xs: 1 }"
      >
        <a-descriptions-item label="电话号码">
          {{ tel.tel }}
        </a-descriptions-item>
        <a-descriptions-item label="号码段">
          {{ tel.duan }}
        </a-descriptions-item>
        <a-descriptions-item label="归属地">
          {{ tel.local }}
        </a-descriptions-item>
        <a-descriptions-item label="通信标准">
          {{ tel.bz }}
        </a-descriptions-item>
        <a-descriptions-item label="卡类型">
          {{ tel.type }}
        </a-descriptions-item>
        <a-descriptions-item label="运营商">
          {{ tel.yys }}
        </a-descriptions-item>
        <a-descriptions-item label="Code">
          {{ tel.code }}
        </a-descriptions-item>
      </a-descriptions>
    </div>

  </div>
-->
  <div>
    <a-tag :color="color">
      {{ color }}
    </a-tag>
    <a-button @click="handleChangeColor">change(GET)</a-button>
    <a-button @click="showColorWarn">change(POST)</a-button>
  </div>
</template>

<script>
// import { getHistory, getTel } from '@/api/test'
import { getColorChange, getColorWarn } from '@/api/test-back'
export default {
  name: 'StudentAppleIndex',
  data () {
    return {
      color: 'blue'
      /*
      history: '',
      telephone: '18547756279',
      tel: {
        tel: '18547756279',
        duan: '',
        local: '',
        bz: '',
        type: '',
        yys: '',
        code: ''
      },
      */
    }
  },
  methods: {
    /*
    fetchTel () {
      getTel(this.telephone).then((res) => {
        const tel = res.data
        this.tel = tel
      })
    }
    */
    handleChangeColor () {
      getColorChange().then((res) => {
        this.color = res.data.color
      })
    },

    showColorWarn () {
        getColorWarn().then((res) => {
          this.color = res.data.color
          console.log(res)
        })
    }
  },
  created () {
    /*
    getHistory().then((res) => {
      const history = res.data
      console.log('历史', history)
      this.history = history
    })

    getTel(this.telephone).then((res) => {
      const tel = res.data
      console.log('电话号码', tel)
      this.tel = tel
    })
    */
    // this.handleChangeColor()
  }
}
</script>

<style scoped>

</style>
