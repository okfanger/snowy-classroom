from rest_framework import permissions, viewsets, status
from rest_framework.response import Response

import copy

from apps.bases.models import DictType, DictCode
from apps.bases.pagination import MyPageNumberPagination
from apps.bases.serializers import DictTypeSerializer, DictCodeSerializer
from apps.bases.filters import DictCodeFilter


class BaseViewSet(viewsets.ModelViewSet):
    # 补充创建者
    def create(self, request, *args, **kwargs):
        data = copy.deepcopy(request.data)
        data["create_user"] = request.user.username or "anonymous"
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    # 补充更新者
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        data = copy.deepcopy(request.data)
        data["update_user"] = request.user.username or "anonymous"
        serializer = self.get_serializer(instance, data=data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data)


class DictTypeViewSet(viewsets.ModelViewSet):
    """
    retrieve:
        获得一个系统字典分类

    list:
        获得系系统字典分类列表

    create:
        创建系统字典分类类型

    delete:
        删除系统字典分类

    partial_update:
        部分修改系统字典分类

    update:
        修改系统字典分类
    """
    queryset = DictType.objects.all()
    serializer_class = DictTypeSerializer
    pagination_class = MyPageNumberPagination
    permission_classes = (permissions.AllowAny,)


class DictCodeViewSet(viewsets.ModelViewSet):
    """
    retrieve:
        获得一个指定系统代码

    list:
        获得系统代码列表

    create:
        创建系统代码

    delete:
        删除系统代码

    partial_update:
        部分修改系统代码

    update:
        修改系统代码
    """
    queryset = DictCode.objects.all()
    serializer_class = DictCodeSerializer
    pagination_class = MyPageNumberPagination
    filter_class = DictCodeFilter
    permission_classes = (permissions.AllowAny,)
