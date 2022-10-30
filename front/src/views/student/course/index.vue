<template>

  <div direction="vertical">
    <a-input-search
      placeholder="请输入课程名"
      enter-button="查询"
      size="large"
      @search="onSearch"
    />

    <br/><br/>

    <a-input-search
      placeholder="请输入课程名"
      enter-button="新增"
      size="large"
      @search="onSearch"
    />

    <br/><br/>

    <a-list item-layout="horizontal" :data-source="data">
      <a-list-item slot="renderItem" slot-scope="item">
        <a-list-item-meta>
          <a slot="title" href="https://www.antdv.com/">{{ item.course }}{{ course }}</a>
          <a-avatar
            slot="avatar"
            src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png"
          />
        </a-list-item-meta>
      </a-list-item>
    </a-list>

    <a-button @click="courseGet">courseGet</a-button>
  </div>

</template>

<script>
import { courseGet } from '@/api/test-back'
const data = [
  {
    title: 'Ant Design Title 1'
  },
  {
    title: 'Ant Design Title 2'
  },
  {
    title: 'Ant Design Title 3'
  },
  {
    title: 'Ant Design Title 4'
  }
]
export default {
  name: 'StudentCourseIndex',
  data () {
    return {
      data,
      course: [{
        name: '',
        open_time: '',
        completed: ''
      }]
    }
  },
  methods: {
    courseGet () {
        courseGet().then((res) => {
            const course = res.data
            this.course = course
            console.log(res)
            console.log(res.data)
            console.log(course)
        })
    }
  }
}
</script>

<style scoped>

</style>
