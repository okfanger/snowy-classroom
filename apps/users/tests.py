import os
import unittest

import pandas as pd
from rest_framework.test import APITransactionTestCase, RequestsClient, APITestCase, APIRequestFactory

from apps.core.entity.student import Student
from apps.core.entity.teacher import Teacher
from apps.users import models
from apps.users.management.commands.init import Command
from apps.users.models import User
from back.settings import BASE_DIR

BASE_URL = 'http://127.0.0.1:8032'
DATA_PATH = os.path.join(BASE_DIR, "data")

class AuthTestCase(APITestCase):

    def setUp(cls):
        factory = APIRequestFactory()

    def tearDown(self) -> None:
        pass

    def test_login(self):
        response = self.client.post(BASE_URL + "/auth/login/", data={
            "username": self.student_account.username,
            "password": self.student_account.password
        })
        rs = response.json()
        self.assertEqual(rs['status'], 200)  # add assertion here


if __name__ == '__main__':
    unittest.main()
