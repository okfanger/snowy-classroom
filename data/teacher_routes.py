
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
]