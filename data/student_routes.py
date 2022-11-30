
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
            'show': False,
        },
        'component': 'student/dashboard/index.vue',
        'redirect': '/course/index'
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
            'show': False, # 是否显示
        },
        'component': 'student/nba/index.vue', # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': '' # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    # 苹果页-学生
    {
        'name': 'apple', # 路由名
        'parentId': 0, # 父菜单ID，如果没有父菜单就写0
        'id': 61003, # 路由ID
        "path": "/apple", # 路由地址（显示在浏览器URL上的）
        'meta': { # 元信息
            'title': 'menu.apple', # 国际化标识，可以在前端locales里增加
            'icon': 'apple', # 图标，这个可以从Ant Design Vue 组件库中找
            'show': False, # 是否显示
        },
        'component': 'student/apple/index.vue', # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': '' # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    # 课程页
    {
        'name': 'course', # 路由名
        'parentId': 0, # 父菜单ID，如果没有父菜单就写0
        'id': 61004, # 路由ID
        "path": "course", # 路由地址（显示在浏览器URL上的）
        'meta': { # 元信息
            'title': 'menu.course', # 国际化标识，可以在前端locales里增加
            'icon': 'profile', # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True, # 是否显示,
        },
        'component': 'RouteView', # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': '/course/index.vue', # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
        # 'hideChildrenInMenu': False,
    },
{
        'name': 'courseIndex', # 路由名
        'parentId': 61004, # 父菜单ID，如果没有父菜单就写0
        'id': 61005, # 路由ID
        "path": "index", # 路由地址（显示在浏览器URL上的）
        'meta': { # 元信息
            'title': 'menu.course.index', # 国际化标识，可以在前端locales里增加
            'icon': 'profile', # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True, # 是否显示,
            # 'hidden': True
        },
        'component': 'student/course/index.vue', # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': '' # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'courseDetail',  # 路由名
        'parentId': 61004,  # 父菜单ID，如果没有父菜单就写0
        'id': 61006,  # 路由ID
        "path": "detail",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.course.detail',  # 国际化标识，可以在前端locales里增加
            'icon': 'profile',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': False,  # 是否显示
            # 'hidden': True
        },
        'component': 'student/course/detail.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'classroomIndex',  # 路由名
        'parentId': 0,  # 父菜单ID，如果没有父菜单就写0
        'id': 61007,  # 路由ID
        "path": "classroom",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.classroom.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'usergroup-add',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
            # 'hidden': True
        },
        'component': 'student/classroom/index.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'onlineJudgeIndex',  # 路由名
        'parentId': 0,  # 父菜单ID，如果没有父菜单就写0
        'id': 61008,  # 路由ID
        "path": "onlinejudge",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.onlineJudge.index',  # 国际化标识，可以在前端locales里增加
            'icon': 'code',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
            # 'hidden': True
        },
        'component': 'student/onlinejudge/index.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    },
    {
        'name': 'exam',  # 路由名
        'parentId': 0,  # 父菜单ID，如果没有父菜单就写0
        'id': 61009,  # 路由ID
        "path": "exam",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.exam',  # 国际化标识，可以在前端locales里增加
            'icon': 'paper',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': True,  # 是否显示
            # 'hidden': True
        },
        'component': 'RouteView',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可

    },
    {
        'name': 'examLive',  # 路由名
        'parentId': 61009,  # 父菜单ID，如果没有父菜单就写0
        'id': 61010,  # 路由ID
        "path": "live",  # 路由地址（显示在浏览器URL上的）
        'meta': {  # 元信息
            'title': 'menu.exam.live',  # 国际化标识，可以在前端locales里增加
            'icon': 'paper',  # 图标，这个可以从Ant Design Vue 组件库中找
            'show': False,  # 是否显示
            # 'hidden': True
        },
        'component': 'student/exam/live.vue',  # 前端.vue文件的相对地址（views为根目录，最前面不用写/）
        'redirect': ''  # 重定向，如果这边填了其实component就没啥用，不需要重定向就留空字符串即可
    }
]