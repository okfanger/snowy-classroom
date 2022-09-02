# -*- coding: utf-8 -*-
# FileName: filters
# Create by Hardy on 2020/10/30
# Description: Django Filter

import django_filters
from apps.bases.models import DictType, DictCode


class DictTypeFilter(django_filters.FilterSet):
    sort = django_filters.OrderingFilter(fields=('type', 'type_name',))

    class Meta:
        model = DictType
        fields = {
            'type': ['exact', ],
            'type_name': ['icontains', ],
        }


class DictCodeFilter(django_filters.FilterSet):
    sort = django_filters.OrderingFilter(fields=('type', 'code', 'name', 'parent'))

    class Meta:
        model = DictCode
        fields = {
            'type': ['exact', ],
            'code': ['exact', 'icontains', ],
            'name': ['icontains', ],
            'parent': ['icontains', ],
        }


