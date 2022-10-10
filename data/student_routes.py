
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
]