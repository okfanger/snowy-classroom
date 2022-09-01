# -*- coding: utf-8 -*-
# FileName: pagination
# Create by Hardy on 2022/3/29
# Description:

from rest_framework.pagination import PageNumberPagination


class MyPageNumberPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'size'
    max_page_size = 100

