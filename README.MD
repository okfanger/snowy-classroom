# drf learning

该项目为drf框架的学习，其中会展示各种常见的模块，作为开发drf的一个初始模板。

## 项目用到的包及版本

- python 3.6
- django 2.2.7
- djangorestframework 3.8.2
- django_filter 2.3.0
- django_filters 0.2.1
- djangorestframework-jwt 1.11.0
- django-rest-swagger 2.2.0
- pygments 2.6.1


## Settings.py系统配置

Settings.py是系统的配置文件，为了不破坏默认配置信息。我们会在同目录下添加一个custom.py文件。
将个性化的配置信息都放在custom.py中。然后在Settings.py中引用custom.py文件：
```python
from .custom import *
```

## requirements文件管理

requirements文件记录了项目所用的包及版本，可以通过以下方式进行自动生成、自动安装

freeze生成requirements文件
```python
pip freeze > requirements.txt
```
pipreqs生成requirements文件	
```python
pipreqs ./ --force
```
安装python环境
```python
pip install -r requirements.txt
```

## 数据管理

###  Code First

```bash
$ python manage.py migrate #第一次同步数据库
$ python manage.py createsuperuser  #创建超级管理员

# 当修改了model后，需要执行下面两句来对数据进行迁移
$ python manage.py makemigrations snippets  
$ python manage.py migrate
```

### DB First

```bash
$ python manage.py inspectdb
```

## 运行项目

```
$ python manage.py runserver
$ python manage.py runserver 8080
$ python manage.py runserver 127.0.0.1:8080
```


