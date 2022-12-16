import request from '@/utils/request'

export const getExamByCourse = (id) => {
  return request({
    url: '/exam/all-by-course/',
    method: 'GET',
    params: {
      id: id
    }
  })
}

export const getExamDetailById = (examId) => {
  return request({
    url: '/exam/one/',
    method: 'GET',
    params: {
      id: examId
    }
  })
}

export const getExamStudentStateById = (examId) => {
  return request({
    url: '/exam/state/',
    method: 'GET',
    params: {
      exam_id: examId
    }
  })
}

export const generateExamByExamId = (examId) => {
  return request({
    url: '/exam/generate/',
    method: 'POST',
    data: {
      examId: examId
    }
  })
}

export const sumbitQuestionRecordAsync = (questionId, answer, examAttendId) => {
  return request({
    url: '/exam/live/submit/',
    method: 'POST',
    data: {
      questionId: questionId,
      answer: answer,
      examAttendId: examAttendId
    }
  })
}

export const overExam = (examAttendId) => {
  return request({
    url: '/exam/over/',
    method: 'POST',
    data: {
      examAttendId: examAttendId
    }
  })
}

export const teacherCreateExam = (form) => {
  return request({
    url: '/exam/teacher/create/',
    method: 'POST',
    data: {
      'id': form.id,
      'name': form.name,
      'start_time': form.date[0],
      'end_time': form.date[1],
      'type': form.type,
      'course': form.course_id
    }
  })
}

export const examRemove = (examId) => {
  return request({
    url: '/exam/remove/',
    method: 'POST',
    data: {
      'id': examId
    }
  })
}

export const QuestionRemove = (questionId) => {
  return request({
    url: '/exam/question/remove/',
    method: 'POST',
    data: {
      'id': questionId
    }
  })
}

export const QuestionOptionRemove = (optionId) => {
  return request({
    url: '/exam/question/option/remove/',
    method: 'POST',
    data: {
      'id': optionId
    }
  })
}

export const questionSaveOrUpdate = (form) => {
  return request({
    url: '/exam/question/save-or-update/',
    method: 'POST',
    data: {
      'id': form.id,
      'title': form.title,
      'type': form.type,
      'examId': form.examId
    }
  })
}
export const questionOptionSaveOrUpdate = (form) => {
  return request({
    url: '/exam/question/option/save-or-update/',
    method: 'POST',
    data: {
      'id': form.id,
      'content': form.content,
      'type': form.type,
      'right': form.right,
      'examId': form.examId,
      'questionId': form.questionId
    }
  })
}

export const saveExamsOptions = (examId, options) => {
  return request({
      url: '/exam/save-options/',
      method: 'POST',
      data: {
        'examId': examId,
        'options': options
      }
    })
}
