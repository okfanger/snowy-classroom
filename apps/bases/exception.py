import json
import logging

from rest_framework import status
from rest_framework.exceptions import ValidationError, ErrorDetail
from rest_framework.views import exception_handler
from rest_framework.response import Response

from apps.bases.response import ErrorResponse


def common_exception_handler(exc, context):
    response = exception_handler(exc, context)
    # 校验错误返回只第一个错误的信息
    if isinstance(exc, ValidationError):
        for k, v in exc.detail.items():
            print(k, v[0])
            return ErrorResponse(msg=f'{k}: {v[0]}')

    # 其余的直接返回错误原文
    return ErrorResponse(msg=str(exc))