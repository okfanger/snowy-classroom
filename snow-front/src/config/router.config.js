// eslint-disable-next-line
import { UserLayout, BasicLayout, BlankLayout } from '@/layouts'
// import { bxAnaalyse } from '@/core/icons'
//
// const RouteView = {
//   name: 'RouteView',
//   render: h => h('router-view')
// }

/**
 * 基础路由
 * @type { *[] }
 */
export const constantRouterMap = [
  {
    path: '/user',
    component: UserLayout,
    redirect: '/user/login',
    hidden: true,
    children: [
      {
        path: 'login',
        name: 'login',
        component: () => import(/* webpackChunkName: "user" */ '@/views/user/Login')
      },
      {
        path: 'register',
        name: 'register',
        component: () => import(/* webpackChunkName: "user" */ '@/views/user/Register')
      },
      {
        path: 'register-result',
        name: 'registerResult',
        component: () => import(/* webpackChunkName: "user" */ '@/views/user/RegisterResult')
      },
      {
        path: 'recover',
        name: 'recover',
        component: undefined
      },
      {
        path: 'sign-in',
        name: 'sign-in',
        component: () => import('@/views/user/SignIn.vue')
      }
    ]
  },
  {
    path: '/404',
    component: () => import(/* webpackChunkName: "fail" */ '@/views/example/exception/404')
  }
]
