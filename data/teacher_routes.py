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
    {
        'name': 'classroom',  # 路由名
        'parentId': 0,  # 父菜单ID，如果没有父菜单就写0
        'id': 51005,  # 路由ID
        "path": "classroom",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
            # 'hidden': True
        },
        'component': 'RouteView',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'approvalIndex',  # 路由名
        'parentId': 51005,  # 父菜单ID，如果没有父菜单就写0
        'id': 51006,  # 路由ID
        "path": "approvalIndex",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.approval.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
            # 'hidden': True
        },
        'component': 'teacher/classroom/ApprovalLeave/approval.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'notice',  # 路由名
        'parentId': 51005,  # 父菜单ID，如果没有父菜单就写0
        'id': 51007,  # 路由ID
        "path": "notice",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.notice.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
            # 'hidden': True
        },
        'component': 'teacher/classroom/notice/notice.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'myNotice',  # 路由名
        'parentId': 51005,  # 父菜单ID，如果没有父菜单就写0
        'id': 51008,  # 路由ID
        "path": "myNotice",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.myNotice.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
            # 'hidden': True
        },
        'component': 'teacher/classroom/notice/myNotice.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'myNoticeDetail',  # 路由名
        'parentId': 51005,  # 父菜单ID，如果没有父菜单就写0
        'id': 51009,  # 路由ID
        "path": "myNoticeDetail",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.myNoticeDetail.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': False,  # 是否显示
            # 'hidden': True
        },
        'component': 'teacher/classroom/notice/myNoticeDetail.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'PickMonitor',  # 路由名
        'parentId': 51005,  # 父菜单ID，如果没有父菜单就写0
        'id': 51010,  # 路由ID
        "path": "PickMonitor",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.PickMonitor.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
            # 'hidden': True
        },
        'component': 'teacher/classroom/monitor/PickMonitor.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },

    # 课程页
    {
        'name': 'course', # 路由名
        'parentId': 0, # 父菜单ID，如果没有父菜单就写0
        'id': 51041, # 路由ID
        "path": "course", # 路由地址（显示在浏览器URL上的）
        'meta': { # 元信息
            'title': 'menu.course', # 国际化标识，可以在前端locales里增加
            'icon': 'profile', # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True, # 是否显示,
        },
        'component': 'RouteView', # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': '/course/index', # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
        # 'hideChildrenInMenu': False,
    },
{
        'name': 'courseIndex', # 路由名
        'parentId': 51041, # 父菜单ID，如果没有父菜单就写0
        'id': 51042, # 路由ID
        "path": "index", # 路由地址（显示在浏览器URL上的）
        'meta': { # 元信息
            'title': 'menu.course.index', # 国际化标识，可以在前端locales里增加
            'icon': 'profile', # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True, # 是否显示,
            # 'hidden': True
        },
        'component': 'teacher/course/index.vue', # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': '' # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'courseDetail',  # 路由名
        'parentId': 51041,  # 父菜单ID，如果没有父菜单就写0
        'id': 51043,  # 路由ID
        "path": "detail",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.course.detail',  # 国际化标识，可以在前端locales里增加
            'icon': 'profile',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': False,  # 是否显示
            # 'hidden': True
        },
        'component': 'teacher/course/detail.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
]
