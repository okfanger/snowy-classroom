import storage from 'store'
import expirePlugin from 'store/plugins/expire'
import { login, getInfo } from '@/api/login'
import { ACCESS_TOKEN } from '@/store/mutation-types'
import { welcome } from '@/utils/util'

storage.addPlugin(expirePlugin)
const user = {
  state: {
    token: '',
    name: '',
    welcome: '',
    avatar: '',
    roles: [],
    info: {}
  },

  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_NAME: (state, { name, welcome }) => {
      state.name = name
      state.welcome = welcome
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    SET_INFO: (state, info) => {
      state.info = info
    }
  },

  actions: {
    // 登录
    Login ({ commit }, userInfo) {
      return new Promise((resolve, reject) => {
        login(userInfo).then(response => {
          console.log(response)
          const data = response.data
          storage.set(ACCESS_TOKEN, data.token, new Date().getTime() + 7 * 24 * 60 * 60 * 1000)
          commit('SET_TOKEN', data.token)
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 获取用户信息
    GetInfo ({ commit }) {
      return new Promise((resolve, reject) => {
        getInfo().then(response => {
          response = {
            'data': {
              'id': 5,
              'create_time': '2022-09-03T21:11:38.079204+08:00',
              'update_time': '2022-09-03T21:11:38.080207+08:00',
              'name': '默认管理员',
              'username': 'admin',
              'email': 'lovefyj616@foxmail.com',
              'telephone': '18547756279',
              roleId: 'admin',
              role: {}
            },
            'message': 'success',
            'status': 200
          }

          const roleObj = {
            id: 'admin',
            name: '管理员',
            describe: '拥有所有权限',
            status: 1,
            creatorId: 'system',
            createTime: 1497160610259,
            deleted: 0,
            permissions: [
              {
                roleId: 'admin',
                permissionId: 'dashboard',
                permissionName: '仪表盘',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'query',
                    describe: '查询',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'exception',
                permissionName: '异常页面权限',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'query',
                    describe: '查询',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'result',
                permissionName: '结果权限',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'query',
                    describe: '查询',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'profile',
                permissionName: '详细页权限',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'query',
                    describe: '查询',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'table',
                permissionName: '表格权限',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"import","defaultCheck":false,"describe":"导入"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'import',
                    describe: '导入',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'form',
                permissionName: '表单权限',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'query',
                    describe: '查询',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'order',
                permissionName: '订单管理',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'query',
                    describe: '查询',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'permission',
                permissionName: '权限管理',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'role',
                permissionName: '角色管理',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'table',
                permissionName: '桌子管理',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"query","defaultCheck":false,"describe":"查询"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'query',
                    describe: '查询',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              },
              {
                roleId: 'admin',
                permissionId: 'user',
                permissionName: '用户管理',
                actions:
                  '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"import","defaultCheck":false,"describe":"导入"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"},{"action":"export","defaultCheck":false,"describe":"导出"}]',
                actionEntitySet: [
                  {
                    action: 'add',
                    describe: '新增',
                    defaultCheck: false
                  },
                  {
                    action: 'import',
                    describe: '导入',
                    defaultCheck: false
                  },
                  {
                    action: 'get',
                    describe: '详情',
                    defaultCheck: false
                  },
                  {
                    action: 'update',
                    describe: '修改',
                    defaultCheck: false
                  },
                  {
                    action: 'delete',
                    describe: '删除',
                    defaultCheck: false
                  },
                  {
                    action: 'export',
                    describe: '导出',
                    defaultCheck: false
                  }
                ],
                actionList: null,
                dataAccess: null
              }
            ]
          }

          roleObj.permissions.push({
            roleId: 'admin',
            permissionId: 'support',
            permissionName: '超级模块',
            actions:
              '[{"action":"add","defaultCheck":false,"describe":"新增"},{"action":"import","defaultCheck":false,"describe":"导入"},{"action":"get","defaultCheck":false,"describe":"详情"},{"action":"update","defaultCheck":false,"describe":"修改"},{"action":"delete","defaultCheck":false,"describe":"删除"},{"action":"export","defaultCheck":false,"describe":"导出"}]',
            actionEntitySet: [
              {
                action: 'add',
                describe: '新增',
                defaultCheck: false
              },
              {
                action: 'import',
                describe: '导入',
                defaultCheck: false
              },
              {
                action: 'get',
                describe: '详情',
                defaultCheck: false
              },
              {
                action: 'update',
                describe: '修改',
                defaultCheck: false
              },
              {
                action: 'delete',
                describe: '删除',
                defaultCheck: false
              },
              {
                action: 'export',
                describe: '导出',
                defaultCheck: false
              }
            ],
            actionList: null,
            dataAccess: null
          })

          response.data.role = roleObj

          const result = response.data
          console.log(response)

          if (result.role && result.role.permissions.length > 0) {
            const role = result.role
            role.permissions = result.role.permissions
            role.permissions.map(per => {
              if (per.actionEntitySet != null && per.actionEntitySet.length > 0) {
                const action = per.actionEntitySet.map(action => { return action.action })
                per.actionList = action
              }
            })
            role.permissionList = role.permissions.map(permission => { return permission.permissionId })
            commit('SET_ROLES', result.role)
            commit('SET_INFO', result)
          } else {
            reject(new Error('getInfo: roles must be a non-null array !'))
          }
          commit('SET_INFO', result)
          commit('SET_NAME', { name: result.name, welcome: welcome() })
          // commit('SET_AVATAR', result.avatar)

          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 登出
    Logout ({ commit, state }) {
      // return new Promise((resolve) => {
      //   logout(state.token).then(() => {
          commit('SET_TOKEN', '')
          commit('SET_ROLES', [])
          storage.remove(ACCESS_TOKEN)
      //     resolve()
      //   }).catch((err) => {
      //     console.log('logout fail:', err)
      //     // resolve()
      //   }).finally(() => {
      //   })
      // })
    }

  }
}

export default user
