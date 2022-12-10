# 管理员的路由id格式：以7开头的5位数字 7xxxx
admin_role_routes = [
    {
        'name': 'dashboard',
        'parentId': 0,
        'id': 71001,
        "path": "/dashboard",
        'meta': {
            'title': 'menu.dashboard',
            'icon': 'dashboard',
            'show': True,
        },
        'component': 'admin/dashboard/index.vue',
        'redirect': ''
    },
    {
        'name': 'overall',
        'parentId': 0,
        'id': 71002,
        "path": "/overall",
        'meta': {
            'title': 'menu.overall',
            'icon': 'dribbble',
            'show': False,
        },
        'component': 'admin/overall/index.vue',
        'redirect': ''
    },
    {
        'name': 'homework',  # 路由名
        'parentId': 0,  # 父菜单ID，如果没有父菜单就写0
        'id': 71003,  # 路由ID
        "path": "homework",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.homework.look',  # 国际化标识，可以在前端locales里增加
            'icon': 'book',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
        },
        'component': 'admin/homework/homework.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },

    {
        'name': 'classroom',  # 路由名
        'parentId': 0,  # 父菜单ID，如果没有父菜单就写0
        'id': 71004,  # 路由ID
        "path": "classroom",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
        },
        'component': 'RouteView',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    # 查看假条
    {
        'name': 'checkLeave',  # 路由名
        'parentId': 71004,  # 父菜单ID，如果没有父菜单就写0
        'id': 71005,  # 路由ID
        "path": "checkLeave",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.MyNote.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
        },
        'component': 'admin/classroom/checkLeave.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    # 查看班委
    {
        'name': 'checkMonitor',  # 路由名
        'parentId': 71004,  # 父菜单ID，如果没有父菜单就写0
        'id': 71006,  # 路由ID
        "path": "checkMonitor",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.checkMonitor.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
        },
        'component': 'admin/classroom/checkMonitor.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    # 查看老师发布的公告
    {
        'name': 'checkNotice',  # 路由名
        'parentId': 71004,  # 父菜单ID，如果没有父菜单就写0
        'id': 71007,  # 路由ID
        "path": "checkNotice",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.checkNotice.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
        },
        'component': 'admin/classroom/checkNotice.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'checkNoticeDetail',  # 路由名
        'parentId': 71004,  # 父菜单ID，如果没有父菜单就写0
        'id': 71008,  # 路由ID
        "path": "checkNoticeDetail",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.myNoticeDetail.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': False,  # 是否显示
            # 'hidden': True
        },
        'component': 'admin/classroom/checkNoticeDetail.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
]
