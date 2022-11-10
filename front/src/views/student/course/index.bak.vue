<template>
  <div>
    <a-input-search placeholder="input search text" style="width: 200px" @search="onSearch" />

    <a-table :columns="columns" :data-source="courseList" :pagination="paginationOpt">

      <!-- 插槽 -->
      <!-- slot="列名" slot-scope="每行该列的元素本体" -->
      <span slot="completed" slot-scope="status">
        <a-checkbox :checked="status"></a-checkbox>
      </span>
    </a-table>
  </div>
</template>

<script>
import { courseGet } from '@/api/test-back'

export default {
  name: 'StudentCourseIndex',
  data () {
    return {
      keyword: '',
      // 分页
      paginationOpt: {
        defaultCurrent: 1, // 默认当前页数
        defaultPageSize: 2, // 默认当前页显示数据的大小
        total: 0, // 总数，必须先有
        showSizeChanger: true,
        showQuickJumper: true,
        pageSizeOptions: ['5', '10', '15', '20'],
        showTotal: (total) => `共 ${total} 条`, // 显示总数

        onShowSizeChange: (current, pageSize) => { // 页数修改时发生的事
          this.paginationOpt.defaultCurrent = 1
          this.paginationOpt.defaultPageSize = pageSize

          this.fetchData()
        },

        // 改变每页数量时更新显示
        onChange: (current, size) => {
          this.paginationOpt.defaultCurrent = current
          this.paginationOpt.defaultPageSize = size

          this.fetchData()
        }
      },
      columns: [
        {
          title: 'ID',
          dataIndex: 'id',
          key: 'id',
          scopedSlots: { customRender: 'id' }
        },
        {
          title: '姓名',
          dataIndex: 'name',
          key: 'name',
          scopedSlots: { customRender: 'name' }
        },
        {
          title: '开启日期',
          dataIndex: 'open_time',
          key: 'open_time',
          scopedSlots: { customRender: 'open_time' }
        }, {
          title: '是否完成',
          dataIndex: 'completed',
          key: 'completed',
          scopedSlots: { customRender: 'completed' }
        }
      ],
      courseList: [{
        name: '',
        open_time: '',
        completed: false
      }]
    }
  },
  methods: {
    fetchData (keyword = '') {
      courseGet({
        page: this.paginationOpt.defaultCurrent,
        page_size: this.paginationOpt.defaultPageSize,
        keyword: keyword
      }).then((res) => {
        this.courseList = res.results
        this.paginationOpt.total = res.count
      })
    },
    onSearch (keyword) {
      this.fetchData(keyword)
    }
  },
  created () {
    this.fetchData()
  }
}
</script>

<style scoped>

</style>
