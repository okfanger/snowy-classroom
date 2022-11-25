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
    url: '/exam/generate',
    method: 'POST',
    data: {
      questionId: questionId,
      answer: answer,
      examAttendId: examAttendId
    }
  })
}
