
# 教师的路由id格式：以5开头的5位数字 5xxxx
teacher_role_routes = [
    {
        'name': 'dashboard',
        'parentId': 0,
        'id': 51001,
        "path": "/dashboard",
        'meta': {
            'title': 'menu.dashboard',
            'icon': 'dashboard',
            'show': True,
        },
        'component': 'teacher/dashboard/index.vue',
        'redirect': ''
    },
    # ikun-老师
    {
        'name': 'ikun',  # 路由名
        'parentId': 0,  # 父菜单ID，如果没有父菜单就写0
        'id': 51002,  # 路由ID
        "path": "/ikun",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.ikun',  # 国际化标识，可以在前端locales里增加
            'icon': 'dribbble',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': False,  # 是否显示
        },
        'component': 'teacher/ikun/index.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },

    {
        'name': 'homework',  # 路由名
        'parentId': 0,  # 父菜单ID，如果没有父菜单就写0
        'id': 51003,  # 路由ID
        "path": "homework",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.homework',  # 国际化标识，可以在前端locales里增加
            'icon': 'book',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
        },
        'component': 'RouteView',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'sendHomeWork',  # 路由名
        'parentId': 51003,  # 父菜单ID，如果没有父菜单就写0
        'id': 51004,  # 路由ID
        "path": "send",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.sendHomework',  # 国际化标识，可以在前端locales里增加
            'icon': 'book',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
        },
        'component': 'teacher/course/sendHomework.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
]