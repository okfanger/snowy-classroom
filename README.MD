# Snowy-Clasroom


## 1. 后端部分运行

### 1.1 第一次部署
进入项目目录 
```bash
cd snowy-clasroom
```


创建虚拟环境
```bash
python -m venv env
```

进入/激活 当前虚拟环境
```bash
env\scripts\activate
```


根据依赖列表安装
```bash
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

初始化数据

```bash
python .\scripts\reset-database-shell.py
```


### 1.2 正常运行项目

进入/激活 当前虚拟环境
```bash
env\scripts\activate
```

运行项目，并绑定到 8032端口（因为前端的proxy挂的也是本地的8032端口）
```bash
python manage.py runserver 127.0.0.1:8032
```


## 2. 前端运行

### 2.1 第一次部署
进入项目目录 
```bash
cd snowy-clasroom
cd front
```

安装yarn （如果之前没有安装过的话）
```bash
npm i -g yarn
```

切换 yarn 镜像源（淘宝的镜像）
```bash
yarn config set registry https://registry.npmmirror.com/
```

使用yarn安装前端依赖
```bash
yarn install
```
### 2.2 运行前端项目

```bash
yarn run serve
```

## 3. 杂项


### 3.1 导出目录树：
```bash
tree -L 5 -I "node_modules|dist|dist.zip|__pycache__|env|migrations|*.py|*.md" >tree.txt
```

### 3.2 路由开发：

公共后端路由配置文件： `snowy-classroom/data/routes.py`

教师角色路由配置文件： `snowy-classroom/data/teacher_routes.py`

学生角色路由配置文件： `snowy-classroom/data/student_routes.py`

管理员角色路由配置文件： `snowy-classroom/data/admin_routes.py`

每次更新路由需要重置数据库并写入数据，所以只需要在项目根目录下运行

```bash
python .\scripts\reset-database-shell.py
```

即可。 （ 运行的时候，不可以连接数据库，后端也不能跑着（因为要删除数据库文件，如果有其他程序占用会删除失败））


路由描述：

- 教师的路由id格式：以5开头的5位数字 5xxxx
- 学生的路由id格式：以6开头的5位数字 6xxxx
- 管理员的路由id格式：以7开头的5位数字 7xxxx
```python
{
    'name': 'dashboard', # 路由名
    'parentId': 0, # 父菜单ID，如果没有父菜单就写0
    'id': 71001, # 路由ID
    "path": "/dashboard", # 路由地址（显示在浏览器URL上的）
    'meta': { # 元信息
        'title': 'menu.dashboard', # 国际化标识，可以在前端locales里增加
        'icon': 'dashboard', # 图标，这个可以从Ant Design Vue 组件库中找
        'show': True, # 是否显示
    },
    'component': 'admin/dashboard/index.vue', # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
    'redirect': '' # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
},

```

可选参数文档：
`{ Route }` 对象

| 参数     | 说明                                      | 类型    | 默认值 |
| -------- | ----------------------------------------- | ------- | ------ |
| hidden   | 控制路由是否显示在 sidebar                | boolean | false |
| redirect | 重定向地址, 访问这个路由时,自定进行重定向 | string  | -      |
| name     | 路由名称, 必须设置,且不能重名           | string  | -      |
| meta     | 路由元信息（路由附带扩展信息）            | object  | {}     |
| hideChildrenInMenu | 强制菜单显示为Item而不是SubItem(配合 meta.hidden) | boolean  | -   |


可选参数文档：`{ Meta }` 路由元信息对象

| 参数                | 说明                                                         | 类型    | 默认值 |
| ------------------- | ------------------------------------------------------------ | ------- | ------ |
| title               | 路由标题, 用于显示面包屑, 页面标题 *推荐设置                 | string  | -      |
| icon                | 路由在 menu 上显示的图标                                     | [string,svg]  | -      |
| keepAlive           | 缓存该路由                                                   | boolean | false  |
| target              | 菜单链接跳转目标（参考 html a 标记）                          | string | -  |
| hidden              | 配合`hideChildrenInMenu`使用，用于隐藏菜单时，提供递归到父菜单显示 选中菜单项_（可参考 个人页 配置方式）_ | boolean | false  |
| hiddenHeaderContent | *特殊 隐藏 [PageHeader](https://github.com/vueComponent/ant-design-vue-pro/blob/master/src/components/PageHeader/PageHeader.vue#L6) 组件中的页面带的 面包屑和页面标题栏 | boolean | false  |

> 路由自定义 `Icon` 请引入自定义 `svg` Icon 文件，然后传递给路由的 `meta.icon` 参数即可


# 测试
pytest测试

1. 测试文件放在tests目录下
2. 测试文件名必须以test_开头
3. 测试函数名必须以test_开头
4. 测试函数必须有一个参数，参数名可以随意，但是必须有
5. 测试函数中，如果有断言，断言必须以assert开头

```
pip install allure-pytest
```

下载文件：

https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/2.9.0/allure-commandline-2.9.0.zip

解压后，将allure文件夹下的bin目录添加到环境变量PATH中

最后在项目根目录下执行（测试之前需要把后端开着）

```
python scripts\allure-test.py
```