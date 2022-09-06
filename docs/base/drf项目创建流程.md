## 项目创建过程

### 用Pycharm创建一个Django空项目

- 选择File->New Project->Django
- 项目的名称建议为xxx_yyy格式，就是全用小写的，两个单词之间用下划线。
- 选择New enverionment，选择一个Python版本，最低3.6，建议最新的，但要保证可以配合所需的包一起使用。
- 这里保持Application Name为空，也是我们在这里不创建App，只创建一个空项目。

### 手动创建一个Django项目

```bash
# 创建一个virtualenv来隔离我们本地的包依赖关系
$ virtualenv env
$ source env/bin/activate  # linux进入虚拟环境
$ env\Scripts\activate # windows下进入虚拟虚拟环境
# 退出虚拟环境用deactivate

# 在创建的虚拟环境中安装Django
$ pip install django
$ pip install djangorestframework

# 创建一个新项目和一个单个应用
$ django-admin.py startproject djangorest1
$ cd djangorest1
$ python manage.py startapp snippets

# 将应用创建在apps目录下
$ cd apps
$ python ..\manage.py startapp schools
```

备注：需要安装的包和版本信息
- python 3.6
- django 2.2.7
- djangorestframework 3.8.2
- django_filter 2.3.0
- djangorestframework-jwt 1.11.0
- django-rest-swagger 2.2.0
- pygments 2.6.1

### 调整目录结构如下

- apps/(项目app)
- docs/(项目文档)
- medias/(上传文件)
- scripts/(各种脚本)
- static/（静态文件）
- templates/(模板文件)
- tests/(测试代码)
- AUTHORS.md（作者列表）
- README.md（说明文档）
- VERSION.md(版本文档)

#### apps目录结构
- myapp1
  - models.py      
- myapp2
  - models/
    - amodels.py
    - bmodels.py 

当需要创建一个App时，请先进入apps这个目录，这样创建的app就在apps目录里了。
为了让项目都能自动识别，还需要在settings.py文件中加：

```python
sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))
```

### 配置Settings.py

Settings.py是系统的配置文件，为了不破坏默认配置信息。我们会在同目录下添加一个custom.py文件。
将个性化的配置信息都放在custom.py中。然后在Settings.py中引用custom.py文件：
```python
from .custom import *

```


### 运行项目

```
$ python manage.py runserver
$ python manage.py runserver 8080
$ python manage.py runserver 127.0.0.1:8080
```
