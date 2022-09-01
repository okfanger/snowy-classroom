
## django-rest-swagger
[参考地址](https://www.jianshu.com/p/c53de96f3ff1)

### 安装
```
$ pip install django-rest-swagger
```

### 设置

进入到setting.py文件，在INSTALLED_APPS=[]的中括号里添加
'rest_framework_swagger'

### 进入views.py 对class补充注释
```
    retrieve:
        Return a user instance.
    
    list:
        Return all users,ordered by most recent joined.
    
    create:
        Create a new user.
    
    delete:
        Remove a existing user.
    
    partial_update:
        Update one or more fields on a existing user.
    
    update:
        Update a user.
```

### 进入urls.py 

```
# 导入辅助函数get_schema_view
from rest_framework.schemas import get_schema_view
# 导入两个类
from rest_framework_swagger.renderers import SwaggerUIRenderer,OpenAPIRenderer

# 利用辅助函数引入所导入的两个类
schema_view = get_schema_view(title='API',renderer_classes=[SwaggerUIRenderer,OpenAPIRenderer])

path('docs/',schema_view,name='docs')   # 配置docs的url路径

```