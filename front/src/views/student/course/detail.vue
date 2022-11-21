<template>
  <div>
    <a-card
      :key="course.id"
      hoverable
      :class="['card',`card-style${$route.query.id%4}`]"
    >
      <a-card-meta>
        <template #title>
          <span class="card-title">{{ course.name }}</span>

        </template>

        <!--        <template #description>-->
        <!--          <span class="card-desc">{{ teacher.teacher_set.map(_=>_.user.name).join() }}-->
        <!--            <br /> {{ moment(teacher.open_time).format("yyyy-MM-DD") }} 开课-->
        <!--          </span>-->

        <!--        </template>-->
      </a-card-meta>
      <div class="card-mask">
        <img height="100%" :src="style2mask[`${course.id%4}`]" alt="mark"></div>

    </a-card>
    <!--    <div style="height: 20px"></div>-->
    <div class="tab-container" style="background: white">
      <a-tabs default-active-key="4">
        <a-tab-pane key="1" tab="作业" size="large">
          Content of tab 1
        </a-tab-pane>
        <a-tab-pane key="2" tab="小组">
          Content of tab 2
        </a-tab-pane>
        <a-tab-pane key="3" tab="成员">
          <Member :course-id="parseInt($route.query['id'])"> </Member>
        </a-tab-pane>
        <a-tab-pane key="4" tab="考试">
          <Exam :course-id="parseInt($route.query['id'])"></Exam>
        </a-tab-pane>
      </a-tabs>
    </div>
    <!--    {{ teacher }}-->

  </div>

</template>

<script>
import { getStudentOne } from '@/api/course'
import { style2mask } from '@/utils/custom'
import moment from 'moment'

const examComponent = () => import('./exam')
const memberComponent = () => import('./member')
// import examComponent from '@/views/student/course/exam'
export default {
  name: 'StudentCourseDetail',
  components: {
    'Exam': examComponent,
    'Member': memberComponent
  },
  data () {
    return {
      course: {

      },
      style2mask,
      moment,
      tabValue: 'a'
    }
  },
  created () {
    getStudentOne(this.$route.query['id']).then((res) => {
      console.log(res.data)
      this.course = res.data
    })
  }
}
</script>

<style scoped lang="less">

.tab-container {
  background: white;
  padding: 0 10px;

  ::v-deep .ant-tabs-tab {
    margin: 0;
  }
}

.card{
  user-select:none;
  /*margin-top: 10px;*/
  /*margin-right: 10px;*/
  /*width:100%;*/
  /*height: 100px;*/
  position: relative;
  /*border-radius: 4px;*/
  //-webkit-transition: all 0.3s;
  //transition: all 0.3s;
  flex: 0 0 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
}

.card-mask {
  position: absolute;
  top: 0;
  right: 0;
  height: 100%;
  z-index: 5;
}

.card-desc {
  color: white;
  overflow: hidden;
  width: 100%;
  text-align: left;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.card-title {
  color: white;
  font-weight: 500;
  text-align: left;
  font-size: 20px;
  word-break: break-all;
  word-wrap: break-word;
  line-height: 23px;
  max-height: 46px;
  overflow: hidden;
  display: -webkit-box;
  //-webkit-box-orient: vertical;
  text-overflow: ellipsis;
  //-webkit-line-clamp: 2;
}
</style>
