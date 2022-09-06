## 配置文件

### 配置Settings.py

Settings.py是系统的配置文件，为了不破坏默认配置信息。我们会在同目录下添加一个custom.py文件。
将个性化的配置信息都放在custom.py中。然后在Settings.py中引用custom.py文件：
```python
from .custom import *
```

### 关于参数适应不同环境

在settings.py中定义的变量，如果需要跟据不同的环境做出相应的修改的话，可以将这些变量加上系统环境变量，例如：
    
    host = os.getenv('MYSQL_HOST_URL') or '127.0.0.1'
    
这样在部署不同环境的时候，可以通过设置系统环境变量来改变这些参数的值。


### 关于STATIC文件

静态文件配置涉及到的参数有三个：

    STATIC_URL          # 通过url可以访问项目中的静态文件
    STATIC_ROOT         # 收集项目中所有引用到的静态文件
    STATICFILES_DIRS    # 静态文件的查找路径（STATIC_ROOT不要包揽进来，否则报错）
    
### 关于MEDIA文件

MEDIA与STATIC的区别是：MEDIA是项目上线后由用户上传的文件

    MEDIA_URL       # 通过url可以访问项目中的文件
    MEDIA_ROOT      # 文件的查找路径
    
由于Django目前的版本可能存在存在问题，在处于DEBUG状态下是无法访问的，所以需要在urls文件中进行以下设置：

    if settings.DEBUG:
        urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

    