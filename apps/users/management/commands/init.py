import logging
import os

from django.conf import settings
from django.core.management.base import BaseCommand
from django.db import connection

from apps.users import models

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
            'name': 'admin',
            'describe': '管理员'
        })


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
        role.save()

        models.User.objects.create(**{
            'id': 1,
            'name': '管理员',
            'username': 'admin',
            'password': '827ccb0eea8a706c4c34a16891f84e7b',
            'telephone': '18547756279',
            'email': 'lovefyj616@foxmail.com',
            'role': role
        }).save()

    def init_route(self):
        pass

    def handle(self, *args, **options):
        init_name_list = options['init_name']
        if "admin" in init_name_list:
            self.init_admin_user()
        if "route" in init_name_list:
            self.init_route()