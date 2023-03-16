<template>
  <div>
    <a-result
      v-if="success"
      status="success"
      title="签到成功！"
    >
      <template #extra>
        <a-button key="console" type="primary" @click="handleGoHome">
          回到首页
        </a-button>
      </template>
    </a-result>
    <a-result v-else status="warning" title="签到失败，考勤任务过期或不存在">
      <template #extra>
        <a-button key="console" type="primary" @click="handleGoHome">
          回到首页
        </a-button>
      </template>
    </a-result>
  </div>
</template>

<script>

import {studentSignInRecord} from '@/api/attend'
import {mapGetters} from 'vuex'

export default {
  name: 'SignIn',
  data() {
    return {
      success: false
    }
  },
  computed: {
    ...mapGetters(['userInfo'])
  },
  methods: {
    handleGoHome() {
      this.$router.push({
        path: '/'
      })
    },
    handleSignIn() {
      studentSignInRecord(this.$route.query['task'])
        .then((res) => {
          if (res.data === 'success') {
            this.success = true
          }
        }).catch((fail) => {
        console.log('fail', fail)
      })
    }
  },
  created() {
    if (Object.keys(this.userInfo).length !== 0) {
      this.handleSignIn()
    } else {
      this.$router.push({
        path: '/user/login',
        query: {
          redirect: this.$route.fullPath
        }
      })
    }
  }
}
</script>

<style scoped>

</style>
