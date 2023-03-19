<template>
  <div>只有教师可以看到的仪表盘

    <br />

    <div>{{ userInfo }}</div>

  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'TeacherDashboard',
  computed: {
    ...mapGetters(['userInfo'])
  }
}
</script>

<style scoped>

</style>
