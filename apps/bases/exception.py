import logging

from rest_framework import status
from rest_framework.views import exception_handler
from rest_framework.response import Response

from apps.bases.response import ErrorResponse


def common_exception_handler(exc, context):
    response = exception_handler(exc, context)
    print(context)
    print(exc)
    logging.error(msg=str(exc))
    return ErrorResponse(msg=str(exc))