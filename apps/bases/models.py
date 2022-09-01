from django.db import models
from django.utils import timezone


class FactSchema(models.Model):
    """
    事实表的基类
    有创建者，更新者，创建时间，更新时间
    """
    create_user = models.CharField("创建者", max_length=50, null=True, blank=True, default='')
    update_user = models.CharField("更新者", max_length=50, null=True, blank=True, default='')
    create_time = models.DateTimeField("创建时间", auto_now_add=True)
    update_time = models.DateTimeField("更新时间", auto_now=True)

    class Meta:
        abstract = True


class SoftSchema(FactSchema):
    """
    具有软删除功能的事实表的基类
    删除操作仅仅是将删除时间写入，查询时过滤掉
    """
    delete_time = models.DateTimeField("删除时间", null=True, blank=True, editable=False)

    class Meta:
        abstract = True

    def delete(self, using=None, keep_parents=False):
        self.delete_time = timezone.now()
        self.save()


class DictType(models.Model):
    """
    字典类型
    """
    type = models.CharField("类型代码", max_length=5, primary_key=True)
    type_name = models.CharField("类型描述", max_length=100, default="")

    class Meta:
        db_table = 'base_dict_type'


class DictCode(models.Model):
    """
    字典代码
    """
    type = models.ForeignKey(to=DictType, on_delete=models.CASCADE)
    code = models.CharField("代码", max_length=50)
    name = models.CharField("代码描述", max_length=100)
    parent = models.CharField("上级代码", max_length=10, null=True, blank=True, default='')

    class Meta:
        db_table = 'base_dict_code'
        unique_together = (("type", "code"),)

    def __str__(self):
        return self.name
