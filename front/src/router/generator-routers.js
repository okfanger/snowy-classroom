// eslint-disable-next-line
import * as loginService from '@/api/login'
// eslint-disable-next-line
import { BasicLayout, BlankLayout, PageView, RouteView } from '@/layouts'

// 前端路由表
const constantRouterComponents = {
  // 基础页面 layout 必须引入
  BasicLayout: BasicLayout,
  BlankLayout: BlankLayout,
  RouteView: RouteView,
  PageView: PageView,
  '403': () => import(/* webpackChunkName: "error" */ '@/views/exception/403'),
  '404': () => import(/* webpackChunkName: "error" */ '@/views/exception/404'),
  '500': () => import(/* webpackChunkName: "error" */ '@/views/exception/500'),

  // 你需要动态引入的页面组件
  Workplace: () => import('@/views/dashboard/Workplace'),
  Analysis: () => import('@/views/dashboard/Analysis'),

  // form
  BasicForm: () => import('@/views/form/basicForm'),
  StepForm: () => import('@/views/form/stepForm/StepForm'),
  AdvanceForm: () => import('@/views/form/advancedForm/AdvancedForm'),

  // list
  TableList: () => import('@/views/list/TableList'),
  StandardList: () => import('@/views/list/BasicList'),
  CardList: () => import('@/views/list/CardList'),
  SearchLayout: () => import('@/views/list/search/SearchLayout'),
  SearchArticles: () => import('@/views/list/search/Article'),
  SearchProjects: () => import('@/views/list/search/Projects'),
  SearchApplications: () => import('@/views/list/search/Applications'),
  ProfileBasic: () => import('@/views/profile/basic'),
  ProfileAdvanced: () => import('@/views/profile/advanced/Advanced'),

  // result
  ResultSuccess: () => import(/* webpackChunkName: "result" */ '@/views/result/Success'),
  ResultFail: () => import(/* webpackChunkName: "result" */ '@/views/result/Error'),

  // exception
  Exception403: () => import(/* webpackChunkName: "fail" */ '@/views/exception/403'),
  Exception404: () => import(/* webpackChunkName: "fail" */ '@/views/exception/404'),
  Exception500: () => import(/* webpackChunkName: "fail" */ '@/views/exception/500'),

  // account
  AccountCenter: () => import('@/views/account/center'),
  AccountSettings: () => import('@/views/account/settings/Index'),
  BasicSetting: () => import('@/views/account/settings/BasicSetting'),
  SecuritySettings: () => import('@/views/account/settings/Security'),
  CustomSettings: () => import('@/views/account/settings/Custom'),
  BindingSettings: () => import('@/views/account/settings/Binding'),
  NotificationSettings: () => import('@/views/account/settings/Notification')

  // 'TestWork': () => import(/* webpackChunkName: "TestWork" */ '@/views/dashboard/TestWork')
}

// 前端未找到页面路由（固定不用改）
const notFoundRouter = {
  path: '*',
  redirect: '/404',
  hidden: true
}

// 根级菜单
const rootRouter = {
  key: '',
  name: 'index',
  path: '',
  component: 'BasicLayout',
  redirect: '/dashboard',
  meta: {
    title: '首页'
  },
  children: []
}

/**
 * 动态生成菜单
 * @param token
 * @returns {Promise<Router>}
 */
export const generatorDynamicRouter = token => {
  return new Promise((resolve, reject) => {
    loginService
      .getCurrentUserNav(token)
      .then(res => {
        // res.data = JSON.parse(res.data)
        res.data = [
          {
            'name': 'dashboard',
            'parentId': 0,
            'id': 1,
            'meta': {
              'title': 'menu.dashboard',
              'icon': 'dashboard',
              'show': true
            },
            'component': 'RouteView',
            'redirect': '/dashboard/workplace'
          },
          {
            'name': 'workplace',
            'parentId': 1,
            'id': 7,
            'meta': {
              'title': 'menu.dashboard.monitor',
              'show': true
            },
            'component': 'Workplace'
          },
          {
            'name': 'monitor',
            'path': 'https://www.baidu.com/',
            'parentId': 1,
            'id': 3,
            'meta': {
              'title': 'menu.dashboard.workplace',
              'target': '_blank',
              'show': true
            }
          },
          {
            'name': 'Analysis',
            'parentId': 1,
            'id': 2,
            'meta': {
              'title': 'menu.dashboard.analysis',
              'show': true
            },
            'component': 'Analysis',
            'path': '/dashboard/analysis'
          },
          {
            'name': 'form',
            'parentId': 0,
            'id': 10,
            'meta': {
              'icon': 'form',
              'title': 'menu.form'
            },
            'redirect': '/form/base-form',
            'component': 'RouteView'
          },
          {
            'name': 'basic-form',
            'parentId': 10,
            'id': 6,
            'meta': {
              'title': 'menu.form.basic-form'
            },
            'component': 'BasicForm'
          },
          {
            'name': 'step-form',
            'parentId': 10,
            'id': 5,
            'meta': {
              'title': 'menu.form.step-form'
            },
            'component': 'StepForm'
          },
          {
            'name': 'advanced-form',
            'parentId': 10,
            'id': 4,
            'meta': {
              'title': 'menu.form.advanced-form'
            },
            'component': 'AdvanceForm'
          },
          {
            'name': 'list',
            'parentId': 0,
            'id': 10010,
            'meta': {
              'icon': 'table',
              'title': 'menu.list',
              'show': true
            },
            'redirect': '/list/table-list',
            'component': 'RouteView'
          },
          {
            'name': 'table-list',
            'parentId': 10010,
            'id': 10011,
            'path': '/list/table-list/:pageNo([1-9]\\d*)?',
            'meta': {
              'title': 'menu.list.table-list',
              'show': true
            },
            'component': 'TableList'
          },
          {
            'name': 'basic-list',
            'parentId': 10010,
            'id': 10012,
            'meta': {
              'title': 'menu.list.basic-list',
              'show': true
            },
            'component': 'StandardList'
          },
          {
            'name': 'card',
            'parentId': 10010,
            'id': 10013,
            'meta': {
              'title': 'menu.list.card-list',
              'show': true
            },
            'component': 'CardList'
          },
          {
            'name': 'search',
            'parentId': 10010,
            'id': 10014,
            'meta': {
              'title': 'menu.list.search-list',
              'show': true
            },
            'redirect': '/list/search/article',
            'component': 'SearchLayout'
          },
          {
            'name': 'article',
            'parentId': 10014,
            'id': 10015,
            'meta': {
              'title': 'menu.list.search-list.articles',
              'show': true
            },
            'component': 'SearchArticles'
          },
          {
            'name': 'project',
            'parentId': 10014,
            'id': 10016,
            'meta': {
              'title': 'menu.list.search-list.projects',
              'show': true
            },
            'component': 'SearchProjects'
          },
          {
            'name': 'application',
            'parentId': 10014,
            'id': 10017,
            'meta': {
              'title': 'menu.list.search-list.applications',
              'show': true
            },
            'component': 'SearchApplications'
          },
          {
            'name': 'profile',
            'parentId': 0,
            'id': 10018,
            'meta': {
              'title': 'menu.profile',
              'icon': 'profile',
              'show': true
            },
            'redirect': '/profile/basic',
            'component': 'RouteView'
          },
          {
            'name': 'basic',
            'parentId': 10018,
            'id': 10019,
            'meta': {
              'title': 'menu.profile.basic',
              'show': true
            },
            'component': 'ProfileBasic'
          },
          {
            'name': 'advanced',
            'parentId': 10018,
            'id': 10020,
            'meta': {
              'title': 'menu.profile.advanced',
              'show': true
            },
            'component': 'ProfileAdvanced'
          },
          {
            'name': 'result',
            'parentId': 0,
            'id': 10021,
            'meta': {
              'title': 'menu.result',
              'icon': 'check-circle-o',
              'show': true
            },
            'redirect': '/result/success',
            'component': 'PageView'
          },
          {
            'name': 'success',
            'parentId': 10021,
            'id': 10022,
            'meta': {
              'title': 'menu.result.success',
              'hiddenHeaderContent': true,
              'show': true
            },
            'component': 'ResultSuccess'
          },
          {
            'name': 'fail',
            'parentId': 10021,
            'id': 10023,
            'meta': {
              'title': 'menu.result.fail',
              'hiddenHeaderContent': true,
              'show': true
            },
            'component': 'ResultFail'
          },
          {
            'name': 'exception',
            'parentId': 0,
            'id': 10024,
            'meta': {
              'title': 'menu.exception',
              'icon': 'warning',
              'show': true
            },
            'redirect': '/exception/403',
            'component': 'RouteView'
          },
          {
            'name': '403',
            'parentId': 10024,
            'id': 10025,
            'meta': {
              'title': 'menu.exception.not-permission',
              'show': true
            },
            'component': 'Exception403'
          },
          {
            'name': '404',
            'parentId': 10024,
            'id': 10026,
            'meta': {
              'title': 'menu.exception.not-find',
              'show': true
            },
            'component': 'Exception404'
          },
          {
            'name': '500',
            'parentId': 10024,
            'id': 10027,
            'meta': {
              'title': 'menu.exception.server-error',
              'show': true
            },
            'component': 'Exception500'
          },
          {
            'name': 'account',
            'parentId': 0,
            'id': 10028,
            'meta': {
              'title': 'menu.account',
              'icon': 'user',
              'show': true
            },
            'redirect': '/account/center',
            'component': 'RouteView'
          },
          {
            'name': 'center',
            'parentId': 10028,
            'id': 10029,
            'meta': {
              'title': 'menu.account.center',
              'show': true
            },
            'component': 'AccountCenter'
          },
          {
            'name': 'settings',
            'parentId': 10028,
            'id': 10030,
            'meta': {
              'title': 'menu.account.settings',
              'hideHeader': true,
              'hideChildren': true,
              'show': true
            },
            'redirect': '/account/settings/basic',
            'component': 'AccountSettings'
          },
          {
            'name': 'BasicSettings',
            'path': '/account/settings/basic',
            'parentId': 10030,
            'id': 10031,
            'meta': {
              'title': 'account.settings.menuMap.basic',
              'show': false
            },
            'component': 'BasicSetting'
          },
          {
            'name': 'SecuritySettings',
            'path': '/account/settings/security',
            'parentId': 10030,
            'id': 10032,
            'meta': {
              'title': 'account.settings.menuMap.security',
              'show': false
            },
            'component': 'SecuritySettings'
          },
          {
            'name': 'CustomSettings',
            'path': '/account/settings/custom',
            'parentId': 10030,
            'id': 10033,
            'meta': {
              'title': 'account.settings.menuMap.custom',
              'show': false
            },
            'component': 'CustomSettings'
          },
          {
            'name': 'BindingSettings',
            'path': '/account/settings/binding',
            'parentId': 10030,
            'id': 10034,
            'meta': {
              'title': 'account.settings.menuMap.binding',
              'show': false
            },
            'component': 'BindingSettings'
          },
          {
            'name': 'NotificationSettings',
            'path': '/account/settings/notification',
            'parentId': 10030,
            'id': 10034,
            'meta': {
              'title': 'account.settings.menuMap.notification',
              'show': false
            },
            'component': 'NotificationSettings'
          }
        ]
        console.log('generatorDynamicRouter response:', res)
        const result = res.data
        const menuNav = []
        const childrenNav = []
        //      后端数据, 根级树数组,  根级 PID
        listToTree(result, childrenNav, 0)
        rootRouter.children = childrenNav
        menuNav.push(rootRouter)
        console.log('menuNav', menuNav)
        const routers = generator(menuNav)
        routers.push(notFoundRouter)
        console.log('routers', routers)
        resolve(routers)
      })
      .catch(err => {
        reject(err)
      })
  })
}

/**
 * 格式化树形结构数据 生成 vue-router 层级路由表
 *
 * @param routerMap
 * @param parent
 * @returns {*}
 */
export const generator = (routerMap, parent) => {
  return routerMap.map(item => {
    const { title, show, hideChildren, hiddenHeaderContent, target, icon } = item.meta || {}
    const currentRouter = {
      // 如果路由设置了 path，则作为默认 path，否则 路由地址 动态拼接生成如 /dashboard/workplace
      path: item.path || `${(parent && parent.path) || ''}/${item.key}`,
      // 路由名称，建议唯一
      name: item.name || item.key || '',
      // 该路由对应页面的 组件 :方案1
      // component: constantRouterComponents[item.component || item.key],
      // 该路由对应页面的 组件 :方案2 (动态加载)
      component: constantRouterComponents[item.component || item.key] || (() => import(`@/views/${item.component}`)),

      // meta: 页面标题, 菜单图标, 页面权限(供指令权限用，可去掉)
      meta: {
        title: title,
        icon: icon || undefined,
        hiddenHeaderContent: hiddenHeaderContent,
        target: target,
        permission: item.name
      }
    }
    // 是否设置了隐藏菜单
    if (show === false) {
      currentRouter.hidden = true
    }
    // 是否设置了隐藏子菜单
    if (hideChildren) {
      currentRouter.hideChildrenInMenu = true
    }
    // 为了防止出现后端返回结果不规范，处理有可能出现拼接出两个 反斜杠
    if (!currentRouter.path.startsWith('http')) {
      currentRouter.path = currentRouter.path.replace('//', '/')
    }
    // 重定向
    item.redirect && (currentRouter.redirect = item.redirect)
    // 是否有子菜单，并递归处理
    if (item.children && item.children.length > 0) {
      // Recursion
      currentRouter.children = generator(item.children, currentRouter)
    }
    return currentRouter
  })
}

/**
 * 数组转树形结构
 * @param list 源数组
 * @param tree 树
 * @param parentId 父ID
 */
const listToTree = (list, tree, parentId) => {
  list.forEach(item => {
    // 判断是否为父级菜单
    if (item.parentId === parentId) {
      const child = {
        ...item,
        key: item.key || item.name,
        children: []
      }
      // 迭代 list， 找到当前菜单相符合的所有子菜单
      listToTree(list, child.children, item.id)
      // 删掉不存在 children 值的属性
      if (child.children.length <= 0) {
        delete child.children
      }
      // 加入到树中
      tree.push(child)
    }
  })
}
