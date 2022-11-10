<template>
  <div>

    <a-input-search placeholder="搜索课程" style="width: 200px" v-model="keyword" />
    <div style="height: 10px"></div>
    <div class="card-gird">
      <template
        v-for="item in courseList"
      >
        <a-card
          :key="item.id"
          hoverable
          :class="['card',`card-style${item.id%4}`]"
          @click="handleTargetTo(item.id)"
        >
          <a-card-meta>
            <template #title>
              <span class="card-title">{{ item.name }}</span>

            </template>

            <template #description>
              <span class="card-desc">{{ item.teacher_set.map(_=>_.user.name).join() }}
                <br /> {{ moment(item.open_time).format("yyyy-MM-DD") }} 开课
              </span>

            </template>
          </a-card-meta>
          <div class="card-mask">
            <img height="100%" :src="style2mask[`${item.id%4}`]" alt="mark"></div>

        </a-card>

      </template>

      <div v-show="courseList.length === 0" class="card">没有匹配的课程

      </div>
    </div>

  </div>
</template>

<script>
import { getStudentAll } from '@/api/course'
import moment from 'moment'
import { style2mask } from '@/utils/custom'

export default {
  name: 'StudentCourseIndex',
  data () {
    return {
      courseListBak: [],
      keyword: '',
      moment,
      style2mask
    }
  },
  computed: {
    courseList () {
      return this.courseListBak.filter((item) => item.name.includes(this.keyword))
    }
  },
  methods: {
    handleTargetTo (id) {
      this.$router.push({
        path: '/course/detail',
        query: {
          id
        }
      })
    },
    fetchData () {
      getStudentAll().then((res) => {
        const courseList = res.data.result
        this.courseListBak = courseList
    })
    }
  },
  created () {
    this.fetchData()
  }
}
</script>

<style scoped lang="less">
@import "@/assets/yuketang.css";

@media screen and (max-width:960px) {
  .card{
    user-select:none;
    margin-top: 10px;
    margin-right: 10px;
    /*width:100%;*/
    /*height: 100px;*/
    position: relative;
    border-radius: 4px;
    -webkit-transition: all 0.3s;
    transition: all 0.3s;
    flex: 0 0 100%;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    //z-index: 12;
  }
}
@media screen and (min-width: 960px) {
  .card {
    user-select: none;
    margin-top: 10px;
    margin-right: 10px;
    /*width:100%;*/
    /*height: 100px;*/
    position: relative;
    border-radius: 4px;
    -webkit-transition: all 0.3s;
    transition: all 0.3s;
    flex: 0 0 32%;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    z-index: 12;
  }
}
.card-gird {
  display: flex;
  align-content: flex-start;
  justify-content: left;
  flex-flow: row wrap;
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
  -webkit-box-orient: vertical;
  text-overflow: ellipsis;
  -webkit-line-clamp: 2;
}
</style>
