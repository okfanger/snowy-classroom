import request from '@/utils/request'
// 发送邮件
export const SendMail = (toUser, title, content) => {
  return request({
    url: '/innermail/send_mail/',
    method: 'POST',
    data: {
      'content': content,
      'title': title,
      'to_user': toUser
    }
  })
}

// 接收邮件(查看邮件)
export const ReceiveMail = (searchMsg) => {
  return request({
    url: '/innermail/receive_mail/',
    method: 'GET',
    params: {
      'search_msg': searchMsg
    }
  })
}

// 是否已读
export const mailNotice = (thisMailId) => {
  return request({
    url: '/innermail/receive_mail/',
    method: 'POST',
    data: {
      'this_mail_id': thisMailId
    }
  })
}
