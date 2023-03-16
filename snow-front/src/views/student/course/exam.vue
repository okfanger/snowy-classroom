<template>
  <div>
    <div>
      <!--      <a-space>-->

      <!--        <a-button >-->
      <!--          创建考试-->
      <!--        </a-button>-->

      <!--      </a-space>-->
    </div>
    <div style="height: 10px"></div>
    <a-table size="middle" :columns="columns" :data-source="examList" :pagination="pagination">
      <template slot="type" slot-scope="type">
        <a-tag :color="type === '线上'?'green':'orange'">{{ type }}</a-tag>
      </template>
      <template slot="start_time" slot-scope="start_time">{{
          moment(start_time).format('YYYY-MM-DD HH:mm:ss')
        }}
      </template>
      <template slot="end_time" slot-scope="end_time">{{ moment(end_time).format('YYYY-MM-DD HH:mm:ss') }}</template>
      <template slot="state" slot-scope="state">

        {{ calcState(state.start_time, state.end_time) }}
      </template>
      <template slot="action" slot-scope="id">
        <a-button @click="entryExam(id)">进入考试</a-button>
      </template>
    </a-table>
  </div>
</template>

<script>
import {getExamByCourse} from '@/api/exam'
import moment from 'moment'
import {calcState} from '@/utils/custom'

export default {
  props: {
    'courseId': {
      type: Number,
      default: -1
    }
  },
  data() {
    return {
      pagination: {
        pageSize: 5
      },
      moment,
      examList: [],
      searchText: '',
      searchInput: null,
      searchedColumn: '',
      columns: [
        {
          title: '考试名',
          dataIndex: 'name',
          key: 'name'
        },
        {
          title: '考试类型',
          dataIndex: 'type',
          key: 'type',
          scopedSlots: {customRender: 'type'}
        },
        {
          title: '开始时间',
          dataIndex: 'start_time',
          key: 'start_time',
          scopedSlots: {customRender: 'start_time'}
        }, {
          title: '结束时间',
          dataIndex: 'end_time',
          key: 'end_time',
          scopedSlots: {customRender: 'end_time'}
        },
        {
          title: '状态',
          key: 'state',
          scopedSlots: {customRender: 'state'}
        },
        {
          title: '操作',
          dataIndex: 'id',
          key: 'action',
          scopedSlots: {customRender: 'action'}
        }
      ]
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    calcState,
    checkQualification() {

    },
    // eslint-disable-next-line camelcase
    fetchData() {
      getExamByCourse(this.courseId).then((res) => {
        this.examList = res.data
        console.log(res)
      })
    },
    handleSearch(selectedKeys, confirm, dataIndex) {
      confirm()
      this.searchText = selectedKeys[0]
      this.searchedColumn = dataIndex
    },

    handleReset(clearFilters) {
      clearFilters()
      this.searchText = ''
    },
    entryExam(id) {
      this.$router.push({
        path: '/exam/live',
        query: {
          id
        }
      })
    }
  }
}
</script>
<style scoped>
.highlight {
  background-color: rgb(255, 192, 105);
  padding: 0px;
}
</style>
