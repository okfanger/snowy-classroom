<template>
  <div>
    <a-space>
      <a-button @click="handleNewQuestion">新增问题</a-button>
      <a-button type="primary" @click="handleSavePaper">保存试卷</a-button>
      <a-button @click="handleCheckStudentResult">查看答卷</a-button>
    </a-space>
    <div style="height: 15px"></div>
    <div style="background: white">
      <a-table :loading="tableLoading" :columns="columns" :data-source="dataSource" @expandedRowsChange="expandedRowsChange">
        <div slot="expandedRowRender" slot-scope="record" style="margin: 0">
          <!--        {{ record }}-->
          <a-list item-layout="horizontal" :data-source="record.options">
            <a-list-item slot="renderItem" slot-scope="item">
              <span slot="actions">
                <!--                <a-button size="small" ghost type="primary" >编辑</a-button>-->
                <a-popconfirm
                  title="确定删除吗？"
                  ok-text="Yes"
                  cancel-text="No"
                  @confirm="removeQuestionOption(record, item.id)"
                >
                  <a-button size="small" ghost type="danger">删除</a-button>
                </a-popconfirm>
              </span>

              <a-list-item-meta
              >
                <template slot="description">
                  <a-input @change="handleChangeOptionContent(item)" v-model="item.content" />
                </template>
              </a-list-item-meta>
            </a-list-item>
          </a-list>
        <!--        <div :key="r.id" v-for="r in record.options">{{ r.content }}</div>-->
        </div>

        <template slot="action" slot-scope="record">
          <a-space>

            <a-button size="small" type="primary" @click="handleAddOption(record)">新增选项</a-button>
            <!--            <a-button size="small" @click="handleEditOption(record.id)">编辑选项</a-button>-->

            <a-popconfirm
              title="确定删除吗？"
              ok-text="Yes"
              cancel-text="No"
              @confirm="removeQuestion(record.id)"
            >
              <a-button type="danger" size="small">删除</a-button>
            </a-popconfirm>
          </a-space>
        </template>
      </a-table>
    </div>

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
        <a-form-model-item label="问题内容" prop="title">
          <a-input v-model="form.title" />
        </a-form-model-item>
        <a-form-model-item label="问题类型" prop="type">
          <a-select v-model="form.type" placeholder="请选择题目">
            <a-select-option value="单选题">
              单选题
            </a-select-option>
            <a-select-option value="多选题">
              多选题
            </a-select-option>
          </a-select>
        </a-form-model-item>
      </a-form-model>
    </a-modal>
  </div>

</template>

<script>
import {
  getExamDetailById,
  QuestionRemove,
  QuestionOptionRemove,
  questionSaveOrUpdate, saveExamsOptions
} from '@/api/exam'

export default {
  name: 'ExamEdit',
data () {
    return {
      tableLoading: true,
      inputSwitch: {},
      expendedKeys: [],
      modelTitle: '问题',
      labelCol: { span: 4 },
      wrapperCol: { span: 14 },
      form: {
        title: '',
        type: ''
      },
rules: {
        title: [
          {
            required: true,
            message: '请输入问题内容',
            trigger: 'blur'
          }
        ],
        type: [
          {
            required: true,
            message: '请选择问题类型',
            trigger: 'change'
          }
        ]
      },
      createExamConfirmLoading: false,
      createExamVisible: false,
      columns: [],
      dataSource: []
    }
  },
methods: {
  handleChangeOptionContent (item) {
    item['updateFlag'] = true
  },
  handleCheckStudentResult () {

  },
  handleSavePaper () {
    // eslint-disable-next-line promise/param-names
    new Promise((res, rej) => {
      const uploadList = []
      for (const item of this.dataSource) {
        for (const item2 of item.options) {
          if (item2['content'] === '') continue
          if (item2['updateFlag'] === true) {
            uploadList.push(item2)
          }
        }
      }
      res(uploadList)
    }).then((res) => {
      saveExamsOptions(this.$route.query['id'], res).then((res2) => {
        this.$message.success('保存成功')
      })
    })
  },
  handleEditOption (id) {
    this.inputSwitch[id] = true
  },
  expandedRowsChange (expandedRowKeys) {
    this.expendedKeys = expandedRowKeys
  },
  handleAddOption (record) {
    const option = {
      id: null,
      updateFlag: true,
      content: '',
      questionId: record.id,
      right: false
    }
    record.options.push(option)
  },
  handleNewQuestion () {
    this.modelTitle = '创建问题'
    this.createExamVisible = true
  },
  handleCreateExamOk () {
    this.$refs.ruleForm.validate(valid => {
      if (valid) {
        this.createExamConfirmLoading = true
        questionSaveOrUpdate(
          { ...this.form, examId: this.$route.query['id'] }
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
resetForm () {
    this.$refs.ruleForm.resetFields()
  },
  removeQuestionOption (record, optionId) {
    const after = record.options.filter(item => item.id !== optionId)
    record.options = after
    if (optionId) {
      QuestionOptionRemove(optionId).then(res => {
        this.$message.success('删除成功')
      })
    }
  },
  removeQuestion (questionId) {
    QuestionRemove(questionId).then(res => {
      this.$message.success('删除成功')
    }).finally(() => {
      const after = this.dataSource.filter((item) => item.id !== questionId)
      this.dataSource = after
      // this.fetchData()
    })
  },
fetchData () {
    this.tableLoading = true
  getExamDetailById(this.$route.query['id']).then((res) => {
    console.log(res.data)
    this.exam = res.data
    for (const item of res.data.question_set) {
      for (const item2 of item.options) {
        item2['updateFlag'] = false
      }
    }
    // console.log('de', res.data.question_set)
    this.dataSource = res.data.question_set
  }).finally(() => {
    this.tableLoading = false
  })
  }
  },
created () {
    this.fetchData()
    this.columns = [
      {
        title: '题目名',
        dataIndex: 'title',
        key: 'title',
        slots: { customRender: 'title' },
        scopedSlots: { customRender: 'title' }
      },
      {
        title: '类型',
        dataIndex: 'type',
        key: 'type',
        slots: { customRender: 'type' },
        scopedSlots: { customRender: 'type' }
      },
      {
        title: '操作',
        key: 'action',
        slots: { customRender: 'action' },
        scopedSlots: { customRender: 'action' }
      }

    ]
  }
}
</script>

<style scoped>

</style>
