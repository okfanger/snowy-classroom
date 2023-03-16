<template>
  <div>
    <a-form-model :model="form" :label-col="labelCol" :wrapper-col="wrapperCol">
      <a-form-model-item label="考试名">
        <a-input v-model="form.name"/>
      </a-form-model-item>
      <a-form-model-item label="考试类型">
        <a-select v-model="form.type" placeholder="请选择考试类型">
          <a-select-option value="线上">
            线上
          </a-select-option>
          <a-select-option value="线下">
            线上
          </a-select-option>
        </a-select>
      </a-form-model-item>
      <a-form-model-item label="Activity time">
        <a-range-picker
          :show-time="{ format: 'HH:mm' }"
          format="YYYY-MM-DD HH:mm"
          :placeholder="['开始时间', '结束时间']"
          @change="onDatePickerChange"
          @ok="onDatePickerOk"
        />
      </a-form-model-item>

    </a-form-model>
  </div>
</template>

<script>
export default {
  name: 'Create',
  data() {
    return {}
  },
  methods: {
    onDatePickerChange(value, dateString) {

    },
    onDatePickerOk(value) {

    },
    onSubmit() {
      console.log('submit!', this.form)
    }
  },
  created() {
    const id = this.$route.query['id'] || null
    this.courseId = id
  }
}
</script>

<style scoped>

</style>
