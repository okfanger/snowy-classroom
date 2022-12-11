<template>
  <div>
    <h1 align="center">第一次作业</h1>
    <div>
    <template>
      <a-tooltip>
        <template #title>prompt text</template>
        本次作业为XXXXXXX
      </a-tooltip>
    </template>
    </div>
    <div>
      <template>

        <a-upload
          name="file"
          :multiple="true"
          action="https://www.mocky.io/v2/5cc8019d300000980a055e76"
          :headers="headers"
          @change="handleChange"
        >
          <a-button>
            <upload-outlined></upload-outlined>
            上传文件
          </a-button>
        </a-upload>

      </template>
      <template>
        <a-textarea v-model="value" placeholder="Basic usage" :rows="4"/>
      </template>
    </div>
    <div>
      <template><a-button>提交</a-button></template>
    </div>

  </div>
</template>

<script>
export default {
  name: 'PushHomework'
}
</script>

<style scoped>
div{
  margin: 10px;
  padding-left: 100px;
  padding-right: 100px;
}
</style>
