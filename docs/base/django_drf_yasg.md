1、首先下载yasg包
```bash
pip install drf_yasg
```
依赖于django和djangorestframework

2、配置路由
```python
import user_agents
from django.contrib import admin
from django.shortcuts import redirect
from django.urls import path, include, re_path

from rest_framework import permissions
from rest_framework.decorators import api_view

from drf_yasg import openapi
from drf_yasg.views import get_schema_view

swagger_info = openapi.Info(
    title="Snippets API",
    default_version='v1',
    description="""This is a demo project for the [drf-yasg](https://github.com/axnsan12/drf-yasg) Django Rest Framework library.

The `swagger-ui` view can be found [here](/cached/swagger).
The `ReDoc` view can be found [here](/cached/redoc).
The swagger YAML document can be found [here](/cached/swagger.yaml).

You can log in using the pre-existing `admin` user with password `passwordadmin`.""",  # noqa
    terms_of_service="https://www.google.com/policies/terms/",
    contact=openapi.Contact(email="contact@snippets.local"),
    license=openapi.License(name="BSD License"),
)

SchemaView = get_schema_view(
    validators=['ssv', 'flex'],
    public=True,
    permission_classes=[permissions.AllowAny],
)


def root_redirect(request):
    user_agent_string = request.META.get('HTTP_USER_AGENT', '')
    user_agent = user_agents.parse(user_agent_string)

    if user_agent.is_mobile:
        schema_view = 'cschema-redoc'
    else:
        schema_view = 'cschema-swagger-ui'

    return redirect(schema_view, permanent=True)

urlpatterns = [
    re_path(r'^swagger(?P<format>.json|.yaml)$', SchemaView.without_ui(cache_timeout=0),
                name='schema-json'),
    path('swagger/', SchemaView.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', SchemaView.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
    path('redoc-old/', SchemaView.with_ui('redoc-old', cache_timeout=0), name='schema-redoc-old'),

    re_path(r'^cached/swagger(?P<format>.json|.yaml)$', SchemaView.without_ui(cache_timeout=None),
            name='cschema-json'),
    path('cached/swagger/', SchemaView.with_ui('swagger', cache_timeout=None), name='cschema-swagger-ui'),
    path('cached/redoc/', SchemaView.with_ui('redoc', cache_timeout=None), name='cschema-redoc'),

    path('', root_redirect),
    '''
　　path('admin/', admin.site.urls),
　　your path 
　　'''
]
```
 

3、配置settings
app注册drf_yasg
```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'drf_yasg',
    'rest_framework',
    'test_app',
]
```
swagger配置
```python
SWAGGER_SETTINGS = {
    'LOGIN_URL': '/admin/login',
    'LOGOUT_URL': '/admin/logout',
    'PERSIST_AUTH': True,
    'REFETCH_SCHEMA_WITH_AUTH': True,
    'REFETCH_SCHEMA_ON_LOGOUT': True,

    'DEFAULT_INFO': 'your_project.urls.swagger_info',#这里注意，更改为自己的项目路径

    'SECURITY_DEFINITIONS': {
        'Basic': {
            'type': 'basic'
        },
        'Bearer': {
            'type': 'apiKey',
            'name': 'authorization',
            'in': 'header'
        },
        'Query': {
            'type': 'apiKey',
            'name': 'auth',
            'in': 'query'
        }
    }
}
```