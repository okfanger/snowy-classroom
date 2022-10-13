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
        'show': True,
    },
    'component': 'admin/overall/index.vue',
    'redirect': ''
},
]