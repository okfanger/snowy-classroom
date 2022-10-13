
# 学生的路由id格式：以6开头的5位数字 6xxxx
student_role_routes = [
    {
        'name': 'dashboard',
        'parentId': 0,
        'id': 61001,
        "path": "/dashboard",
        'meta': {
            'title': 'menu.dashboard',
            'icon': 'dashboard',
            'show': True,
        },
        'component': 'student/dashboard/index.vue',
        'redirect': ''
    },
    # 篮球页-学生
    {
        'name': 'basketball', # 路由名
        'parentId': 0, # 父菜单ID，如果没有父菜单就写0
        'id': 61002, # 路由ID
        "path": "/nba", # 路由地址（显示在浏览器URL上的）
        'meta': { # 元信息
            'title': 'menu.nba', # 国际化标识，可以在前端locales里增加
            'icon': 'dribbble', # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True, # 是否显示
        },
        'component': 'student/nba/index.vue', # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': '' # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
]