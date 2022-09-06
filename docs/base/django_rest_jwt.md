__# django-rest-jwt开发步骤
## 安装
```
$ pip install djangorestframework-jwt
```
## settings.py 配置
```
INSTALLED_APPS = [
    ...
    'rest_framework',
    'rest_framework_jwt',
]

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    ),
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.BasicAuthentication',
    ),
}

# 如果需要刷新token则需要配置允许过期及设置过期时间
JWT_AUTH = {
    'JWT_EXPIRATION_DELTA': datetime.timedelta(hours=1),
    'JWT_ALLOW_REFRESH': True,
}

```
## urls.py
```
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token, verify_jwt_token

urlpatterns = [
    path('api-token-auth/', obtain_jwt_token),     #获得token
    path('api-token-refresh/', refresh_jwt_token), #刷新token
    path('api-token-verify/', verify_jwt_token),   #验证token
]
```
## 创建数据库
```
$ python manage.py migrate
$ python manage.py createsuperuser

```
#测试步骤

##获得token
```
$ curl -X POST -d "username=admin&password=password123" http://localhost:8000/api-token-auth/
$ curl -X POST -H "Content-Type: application/json" -d '{"username":"admin","password":"password123"}' http://localhost:8000/api-token-auth/

```
##访问受保护资源
```
$ curl -H "Authorization: JWT <your_token>" http://localhost:8000/protected-url/
```
##刷新token
```
$ curl -X POST -H "Content-Type: application/json" -d '{"token":"<EXISTING_TOKEN>"}' http://localhost:8000/api-token-refresh/
```
##验证token
```
$ curl -X POST -H "Content-Type: application/json" -d '{"token":"<EXISTING_TOKEN>"}' http://localhost:8000/api-token-verify/
```




############## 分割线 ##############
https://blog.csdn.net/u014783334/article/details/124831902