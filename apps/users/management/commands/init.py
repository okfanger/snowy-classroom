import datetime
import logging
import os.path

from tqdm import tqdm
from django.core.management.base import BaseCommand

from apps.core.entity.classroom import ClassRoom
from apps.core.entity.student import Student
from apps.users import models
from apps.users.models import MenuRouter, User, Role

import pandas as pd
from back.settings import BASE_DIR

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    """
    项目初始化命令: python manage.py init
    """

    def add_arguments(self, parser):
        parser.add_argument('init_name', nargs='*', type=str, )

    def init_admin_user(self):

        # 管理员角色创建
        role = models.Role.objects.create(**{
            'name': 'example',
            'describe': '样例页面'
        })

        # action

        # action
        admin_permisson_list = [
            {'symbol': 'result',
             'name': '结果权限'},
            {'symbol': 'profile',
             'name': '详细页权限'},
            {'symbol': 'table',
             'name': '表格权限'},
            {'symbol': 'form',
             'name': '表单权限'},
            {'symbol': 'order',
             'name': '订单管理'},
            {'symbol': 'permission',
             'name': '权限管理'},
            {'symbol': 'role',
             'name': '角色管理'},
            {'symbol': 'table',
             'name': '桌子管理'},
            {'symbol': 'user',
             'name': '用户管理'},
        ]
        action_list = [
            {
                'action': 'add',
                'describe': '新增',
                'defaultCheck': False
            },
            {
                'action': 'query',
                'describe': '查询',
                'defaultCheck': False
            },
            {
                'action': 'get',
                'describe': '详情',
                'defaultCheck': False
            },
            {
                'action': 'update',
                'describe': '修改',
                'defaultCheck': False
            },
            {
                'action': 'delete',
                'describe': '删除',
                'defaultCheck': False
            }
        ]
        admin_permisson_save_list = []
        for j in admin_permisson_list:
            # 部分权限
            permission_temp = models.Permission.objects.create(**j)
            permission_temp.save()

            for i in action_list:
                i['permission'] = permission_temp
                temp = models.PermissionAction.objects.create(**i)
                temp.save()
            admin_permisson_save_list.append(permission_temp)

        role.permissions.set(admin_permisson_save_list)

        admin_route_id_list = [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            10,
            10010,
            10011,
            10012,
            10013,
            10014,
            10015,
            10016,
            10017,
            10018,
            10019,
            10020,
            10021,
            10022,
            10023,
            10024,
            10025,
            10026,
            10027,
            10028,
            10029,
            10030,
            10031,
            10032,
            10033,
            10034,
            10035,
        ]
        role.menu_routes.set(
            MenuRouter.objects.filter(id__in=admin_route_id_list)
        )
        role.save()

        models.User.objects.create(**{
            'id': 1,
            'name': '样例管理员',
            'username': 'example',
            'password': '827ccb0eea8a706c4c34a16891f84e7b',
            'telephone': '13000000000',
            'email': 'qq@none.com',
            'type': 3,
            'role': role
        }).save()

        logger.info("创建样例成功！")

    def init_teacher_user(self):

        # 管理员角色创建
        role = models.Role.objects.create(**{
            'name': 'teacher',
            'describe': '教师'
        })


        # # action
        # teacher_permisson_list = [
        #     {
        #         'symbol': 'student_group',
        #         'name': '查看学生列表权限',
        #         'action': {
        #
        #         }
        #     },
        # ]
        #
        # teacher_permisson_save_list = []
        # for j in teacher_permisson_list:
        #     # 部分权限
        #
        #     temp_action = j['action']
        #     j.pop("action")
        #     permission_temp = models.Permission.objects.create(**j)
        #     permission_temp.save()
        #
        #     temp_action['permission'] = permission_temp
        #     temp = models.PermissionAction.objects.create(**temp_action)
        #     temp.save()
        #     teacher_permisson_save_list.append(permission_temp)
        #
        # role.permissions.set(teacher_permisson_save_list)

        teacher_route_id_list = [
            1, 7
        ]
        role.menu_routes.set(
            MenuRouter.objects.filter(id__in=teacher_route_id_list)
        )
        role.save()

        models.User.objects.create(**{
            'id': 2,
            'name': '小白教师',
            'username': 'teacher',
            'password': '827ccb0eea8a706c4c34a16891f84e7b',
            'telephone': '13000000000',
            'email': 'qq@teacher.com',
            'role': role
        }).save()

        logger.info("创建教师角色成功！")

    def init_route(self):
        default_routes = [
            {
                'name': 'dashboard',
                'parentId': 0,
                'id': 1,
                'meta': {
                    'title': 'menu.dashboard',
                    'icon': 'dashboard',
                    'show': True
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
                    'show': True
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
                    'show': True
                }
            },
            {
                'name': 'Analysis',
                'parentId': 1,
                'id': 2,
                'meta': {
                    'title': 'menu.dashboard.analysis',
                    'show': True
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
                    'title': 'menu.django_sessionform'
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
                    'show': True
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
                    'show': True
                },
                'component': 'TableList'
            },
            {
                'name': 'basic-list',
                'parentId': 10010,
                'id': 10012,
                'meta': {
                    'title': 'menu.list.basic-list',
                    'show': True
                },
                'component': 'StandardList'
            },
            {
                'name': 'card',
                'parentId': 10010,
                'id': 10013,
                'meta': {
                    'title': 'menu.list.card-list',
                    'show': True
                },
                'component': 'CardList'
            },
            {
                'name': 'search',
                'parentId': 10010,
                'id': 10014,
                'meta': {
                    'title': 'menu.list.search-list',
                    'show': True
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
                    'show': True
                },
                'component': 'SearchArticles'
            },
            {
                'name': 'project',
                'parentId': 10014,
                'id': 10016,
                'meta': {
                    'title': 'menu.list.search-list.projects',
                    'show': True
                },
                'component': 'SearchProjects'
            },
            {
                'name': 'application',
                'parentId': 10014,
                'id': 10017,
                'meta': {
                    'title': 'menu.list.search-list.applications',
                    'show': True
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
                    'show': True
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
                    'show': True
                },
                'component': 'ProfileBasic'
            },
            {
                'name': 'advanced',
                'parentId': 10018,
                'id': 10020,
                'meta': {
                    'title': 'menu.profile.advanced',
                    'show': True
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
                    'show': True
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
                    'hiddenHeaderContent': True,
                    'show': True
                },
                'component': 'ResultSuccess'
            },
            {
                'name': 'fail',
                'parentId': 10021,
                'id': 10023,
                'meta': {
                    'title': 'menu.result.fail',
                    'hiddenHeaderContent': True,
                    'show': True
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
                    'show': True
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
                    'show': True
                },
                'component': 'Exception403'
            },
            {
                'name': '404',
                'parentId': 10024,
                'id': 10026,
                'meta': {
                    'title': 'menu.exception.not-find',
                    'show': True
                },
                'component': 'Exception404'
            },
            {
                'name': '500',
                'parentId': 10024,
                'id': 10027,
                'meta': {
                    'title': 'menu.exception.server-error',
                    'show': True
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
                    'show': True
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
                    'show': True
                },
                'component': 'AccountCenter'
            },
            {
                'name': 'settings',
                'parentId': 10028,
                'id': 10030,
                'meta': {
                    'title': 'menu.account.settings',
                    'hideHeader': True,
                    'hideChildren': True,
                    'show': True
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
                    'show': False
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
                    'show': False
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
                    'show': False
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
                    'show': False
                },
                'component': 'BindingSettings'
            },
            {
                'name': 'NotificationSettings',
                'path': '/account/settings/notification',
                'parentId': 10030,
                'id': 10035,
                'meta': {
                    'title': 'account.settings.menuMap.notification',
                    'show': False
                },
                'component': 'NotificationSettings'
            }
        ]

        default_routes.extend([
            {
                'name': 'dashboard',
                'parentId': 0,
                'id': 2000,
                'meta': {
                    'title': 'menu.dashboard',
                    'icon': 'dashboard',
                    'show': True
                },
                'component': 'student/dashboard',
                'redirect': ''
            }
        ])

        logger.info("正在生成路由")
        for item in tqdm(default_routes):
            meta = models.MenuRouterMeta.objects.create(**item['meta'])
            meta.save()
            item['meta'] = meta
            models.MenuRouter.objects.create(**item).save()
        logger.info("生成完毕")
        pass

    def init_student_user(self):

        # 生成学生角色
        role = models.Role.objects.create(**{
            'name': 'student',
            'describe': '学生'
        })

        # action
        student_permisson_list = [
            {
                'symbol': 'student_group',
                'name': '查看学生列表权限',
                'action': {

                }
            },
        ]

        # student_permisson_save_list = []
        # for j in student_permisson_list:
        #     # 部分权限
        #
        #     temp_action = j['action']
        #     j.pop("action")
        #     permission_temp = models.Permission.objects.create(**j)
        #     permission_temp.save()
        #
        #     temp_action['permission'] = permission_temp
        #     temp = models.PermissionAction.objects.create(**temp_action)
        #     temp.save()
        #     student_permisson_save_list.append(permission_temp)
        #
        # role.permissions.set(student_permisson_save_list)

        student_route_id_list = [
            2000
        ]
        role.menu_routes.set(
            MenuRouter.objects.filter(id__in=student_route_id_list)
        )
        role.save()

        # 建立班级
        ClassRoom.objects.create(**{
            "adviser": None
        })

        # 导入计科3
        df = pd.read_excel(os.path.join(BASE_DIR, "docs", "data", "计科三班学生信息.xls"), sheet_name=0)
        for row in df.itertuples():
            user_create = User.objects.create(**{
                "name": getattr(row, "姓名"),
                "username": getattr(row, "学号"),
                "password": "827ccb0eea8a706c4c34a16891f84e7b",
                "email": f'{getattr(row, "学号")}@qq.com',
                "type": 1,
                "role_id": role
            })

            student_create = Student.objects.create(**{
                "grade": 3,
                "attend_date": datetime.datetime(2020, 9, 1, 0, 0, 0),
            })

        print(df)

    def handle(self, *args, **options):
        init_name_list = options['init_name']
        if "admin" in init_name_list:
            self.init_admin_user()
        if "route" in init_name_list:
            self.init_route()
        if "teacher" in init_name_list:
            self.init_teacher_user()
        if "student" in init_name_list:
            self.init_student_user()
