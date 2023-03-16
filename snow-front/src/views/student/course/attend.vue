<template>
  <div>

    <div>
      <a-button v-if="signInSwitch" @click="handleSignIn">签到</a-button>
    </div>

  </div>
</template>

<script>

import {getCourseAttendBeforeCreateStatus, studentSignInRecord} from '@/api/attend'

export default {
  name: 'Attend',
  props: {
    'courseId': {
      type: Number,
      default: -1
    }
  },
  data() {
    return {
      signInSwitch: false,
      asyncAttendRecord: null
    }
  },
  methods: {

    handleSignIn() {
      studentSignInRecord(this.asyncAttendRecord.id).then((res) => {
        console.log(res.data)
      })
    }
  },
  created() {
    getCourseAttendBeforeCreateStatus(this.courseId).then((res) => {
      this.attend_able = res.data.attend_able
      this.attend_expire_time = res.data.expire_time
      this.asyncAttendRecord = res.data.task
      if (res.data.task) {
        this.signInSwitch = true
      }
      console.log(res.data.task)
    })
  }
}
</script>

<style scoped>

</style>
