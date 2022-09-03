from django.db import models

from apps.bases.models import FactSchema


class User(FactSchema):
    name = models.CharField(max_length=128, verbose_name='用户中文名')
    username = models.CharField(max_length=64, unique=True, verbose_name='用户编码')
    password = models.CharField(max_length=256, verbose_name='密码')
    email = models.EmailField(unique=True, verbose_name='邮箱')
    telephone = models.CharField(max_length=20, verbose_name='电话号码')
    role = models.IntegerField(default=1, verbose_name='权限组', choices=((1, '学生'), (2, '教师'), (3, '超级管理员')))


    @property
    def is_authenticated(self):
        """
        Always return True. This is a way to tell if the user has been
        authenticated in templates.
        """
        return True
