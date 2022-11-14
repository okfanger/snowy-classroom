<template>
  <div>

  </div>
</template>

<script>
export default {
  name: 'Questionnaire',
  data () {
    return {
      vaild: true
    }
  },
  created () {
    const id = this.$route.query['id'] || undefined
    if (!id) this.vaild = false
  }
}
</script>

<style scoped>

</style>
