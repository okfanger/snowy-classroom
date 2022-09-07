from django.db import models

from apps.bases.models import FactSchema


class User(FactSchema):
    name = models.CharField(max_length=128, verbose_name='用户中文名')
    username = models.CharField(max_length=64, unique=True, verbose_name='用户编码')
    password = models.CharField(max_length=256, verbose_name='密码')
    email = models.EmailField(unique=True, verbose_name='邮箱')
    telephone = models.CharField(max_length=20, verbose_name='电话号码')
    type = models.IntegerField(default=1, verbose_name='身份', choices=((1, '学生'), (2, '教师'), (3, '超级管理员')))
    role = models.ForeignKey("Role", on_delete=models.PROTECT)

    @property
    def is_authenticated(self):
        """
        Always return True. This is a way to tell if the user has been
        authenticated in templates.
        """
        return True


class Permission(FactSchema):
    symbol = models.CharField(verbose_name="权限标志", max_length=256)
    name = models.CharField(verbose_name='权限中文名', max_length=256)


class PermissionAction(FactSchema):
    permission = models.ForeignKey('Permission', related_name='actionEntitySet', on_delete=models.CASCADE,
                                   verbose_name='权限子集')
    action = models.CharField(verbose_name='操作名', max_length=256)
    describe = models.CharField(verbose_name='操作描述', null=True, max_length=256)
    defaultCheck = models.BooleanField(default=False, verbose_name='默认操作')


class Role(FactSchema):
    name = models.CharField(verbose_name='角色', max_length=256)
    describe = models.CharField(verbose_name='角色描述', null=True, max_length=256)
    permissions = models.ManyToManyField(to='Permission', verbose_name='拥有的权限')
    menu_routes = models.ManyToManyField(to='MenuRouter', verbose_name='自己的路由')


class MenuRouter(FactSchema):
    parentId = models.IntegerField(verbose_name='父菜单id名', default=1)
    name = models.CharField(verbose_name='路由名', max_length=256)
    component = models.CharField(verbose_name='组件名', max_length=256)
    redirect = models.CharField(verbose_name='重定向路径', null=True, max_length=256)
    hidden = models.BooleanField(verbose_name='控制路由是否显示在 sidebar', default=False)
    hideChildrenInMenu = models.BooleanField(verbose_name='强制菜单显示为Item而不是SubItem(配合 meta.hidden)',
                                             default=False)
    meta = models.OneToOneField("MenuRouterMeta", to_field='id', on_delete=models.CASCADE)
    path = models.CharField(verbose_name='路径', max_length=512)

class MenuRouterMeta(FactSchema):
    title = models.CharField(verbose_name='路由标题, 用于显示面包屑, 页面标题 * 推荐设置', max_length=256)
    icon = models.CharField(verbose_name='路由在menu上显示的图标[string, svg]', max_length=256)
    keepAlive = models.BooleanField(verbose_name='缓存该路由', default=False)
    target = models.CharField(verbose_name='菜单链接跳转目标（参考html a 标记）', max_length=256)
    hidden = models.BooleanField(
        verbose_name='配合hideChildrenInMenu使用，用于隐藏菜单时，提供递归到父菜单显示选中菜单项_（可参考个人页配置方式）',
        default=False)
    hiddenHeaderContent = models.BooleanField(verbose_name='隐藏PageHeader组件中的页面带的面包屑和页面标题栏',
                                              default=False)
    hideChildren = models.BooleanField(verbose_name='是否隐藏children', default=False)
    hideHeader = models.BooleanField(verbose_name='是否隐藏头部', default=False)
    show = models.BooleanField(verbose_name='是否显示', default=True)

