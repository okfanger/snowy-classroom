<template>
  <div>
    <div>
      <a-space>

        <a-button @click="handleCreateExamWindow" >
          创建考试
        </a-button>

      </a-space>
    </div>
    <div style="height: 10px"></div>
    <a-table size="middle" :columns="columns" :data-source="examList" :pagination="pagination">
      <template slot="type" slot-scope="type">
        <a-tag :color="type === '线上'?'green':'orange'">{{ type }}</a-tag></template>
      <template slot="start_time" slot-scope="start_time">{{ moment(start_time).format('YYYY-MM-DD HH:mm:ss') }}</template>
      <template slot="end_time" slot-scope="end_time">{{ moment(end_time).format('YYYY-MM-DD HH:mm:ss') }}</template>
      <template slot="state" slot-scope="state">

        {{ calcState(state.start_time, state.end_time) }}
      </template>
      <template slot="action" slot-scope="id">
        <a-space>
          <a-button type="primary" size="small" @click="entryExam(id)">查看</a-button>
          <a-button size="small" @click="editExam(id)">编辑</a-button>
          <a-popconfirm
            title="确定删除吗？"
            ok-text="Yes"
            cancel-text="No"
            @confirm="removeExam(id)"
          >
            <a-button type="danger" size="small" @click="removeExam(id)">删除</a-button>
          </a-popconfirm>
        </a-space>
      </template>
    </a-table>

    <a-modal
      :title="modelTitle"
      :visible="createExamVisible"
      :confirm-loading="createExamConfirmLoading"
      @ok="handleCreateExamOk"
      @cancel="handleCreateExamCancel"
    >
      <a-form-model
        :model="form"
        :label-col="labelCol"
        :wrapper-col="wrapperCol"
        ref="ruleForm"
        :rules="rules"
      >
        <a-form-model-item label="考试名" prop="name">
          <a-input v-model="form.name" />
        </a-form-model-item>
        <a-form-model-item label="考试类型" prop="type">
          <a-select v-model="form.type" placeholder="请选择考试类型">
            <a-select-option value="线上">
              线上
            </a-select-option>
            <a-select-option value="线下">
              线下
            </a-select-option>
          </a-select>
        </a-form-model-item>
        <a-form-model-item label="有效时间">
          <a-range-picker
            required
            v-model="form.date"
            :show-time="{ format: 'HH:mm' }"
            format="YYYY-MM-DD HH:mm"
            :placeholder="['开始时间', '结束时间']"
          />
        </a-form-model-item>
      </a-form-model>
    </a-modal>
  </div>
</template>

<script>
import { examRemove, getExamByCourse, teacherCreateExam } from '@/api/exam'
import moment from 'moment'
import { calcState } from '@/utils/custom'

export default {
  props: {
    'courseId': {
      type: Number,
      default: -1
    }
  },
  data () {
    return {
      modelTitle: '考试',
      labelCol: { span: 4 },
      wrapperCol: { span: 14 },
      form: {
        name: '',
        type: '',
        date: []
      },
      createExamConfirmLoading: false,
      createExamVisible: false,
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
          scopedSlots: { customRender: 'type' }
        },
        {
          title: '开始时间',
          dataIndex: 'start_time',
          key: 'start_time',
          scopedSlots: { customRender: 'start_time' }
        }, {
          title: '结束时间',
          dataIndex: 'end_time',
          key: 'end_time',
          scopedSlots: { customRender: 'end_time' }
        },
        {
          title: '状态',
          key: 'state',
          scopedSlots: { customRender: 'state' }
        },
        {
          title: '操作',
          dataIndex: 'id',
          key: 'action',
          fixed: 'right',
          scopedSlots: { customRender: 'action' }
        }
        ],
      rules: {
        name: [
          { required: true, message: '考试名不能为空', trigger: 'blur' }
        ],
        date: [
          { required: true, message: '请选择起止时间', trigger: 'change' }
        ],
        type: [
          {
            required: true,
            message: '请选择考试类型',
            trigger: 'change'
          }
        ]
             }
    }
  },
created () {
    this.fetchData()
  },
  methods: {
    removeExam (id) {
      examRemove(id).then(res => {
        this.$message.success('删除成功')
        this.fetchData()
      })
    },
    editExam (id) {
      this.form = { ...this.examList.filter(item => item.id === id)[0] }
      this.form['date'] = [this.form.start_time, this.form.end_time]
      this.form['id'] = id
      this.modelTitle = '修改考试'
      this.createExamVisible = true
    },
    resetForm () {
      this.$refs.ruleForm.resetFields()
    },

    onSubmit () {
    },
    handleCreateExamOk () {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.createExamConfirmLoading = true
          teacherCreateExam(
            { ...this.form, course_id: this.$route.query['id'] }
          ).then((res) => {
            if (res.data === 'success') {
              this.$message.success('创建成功')
            }
            this.createExamVisible = false
            this.createExamConfirmLoading = false
          }).finally(() => {
            this.fetchData()
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
handleCreateExamCancel () {
    this.createExamVisible = false
    this.resetForm()
    },
    handleCreateExamWindow () {
      this.createExamVisible = true
      this.resetForm()
      this.modelTitle = '创建考试'
      // this.$router.push({
      //   path: '/exam/create',
      //   query: {
      //     id: this.courseId
      //   }
      // })
    },
    calcState,
    checkQualification () {

    },
    // eslint-disable-next-line camelcase
    fetchData () {
      getExamByCourse(this.courseId).then((res) => {
        this.examList = res.data
        console.log(res)
      })
    },
    handleSearch (selectedKeys, confirm, dataIndex) {
      confirm()
      this.searchText = selectedKeys[0]
      this.searchedColumn = dataIndex
    },

    handleReset (clearFilters) {
      clearFilters()
      this.searchText = ''
    },
    entryExam (id) {
      this.$router.push({
        path: '/exam/edit',
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
