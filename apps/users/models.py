from django.db import models


class User(models.Model):
    username = models.CharField(max_length=64, unique=True, verbose_name='用户编码')
    name = models.CharField(max_length=128, verbose_name='用户中文名')
    password = models.CharField(max_length=256, verbose_name='密码')
    email = models.EmailField(unique=True, verbose_name='邮箱')
    # enabled = models.IntegerField(default=1, verbose_name='是否启用', choices=((1, '启用'), (0, '停用')))


    @property
    def is_authenticated(self):
        """
        Always return True. This is a way to tell if the user has been
        authenticated in templates.
        """
        return True
