default_routes = [
    # {
    #     'name': 'dashboard',
    #     'parentId': 0,
    #     'id': 1,
    #     'meta': {
    #         'title': 'menu.dashboard',
    #         'icon': 'dashboard',
    #         'show': True
    #     },
    #     'component': 'RouteView',
    #     'redirect': '/dashboard/workplace'
    # },
    # {
    #     'name': 'workplace',
    #     'parentId': 1,
    #     'id': 7,
    #     'meta': {
    #         'title': 'menu.dashboard.monitor',
    #         'show': True
    #     },
    #     'component': 'Workplace'
    # },
    # {
    #     'name': 'monitor',
    #     'path': 'https://www.baidu.com/',
    #     'parentId': 1,
    #     'id': 3,
    #     'meta': {
    #         'title': 'menu.dashboard.workplace',
    #         'target': '_blank',
    #         'show': True
    #     }
    # },
    # {
    #     'name': 'Analysis',
    #     'parentId': 1,
    #     'id': 2,
    #     'meta': {
    #         'title': 'menu.dashboard.analysis',
    #         'show': True
    #     },
    #     'component': 'Analysis',
    #     'path': '/dashboard/analysis'
    # },
    # {
    #     'name': 'form',
    #     'parentId': 0,
    #     'id': 10,
    #     'meta': {
    #         'icon': 'form',
    #         'title': 'menu.django_sessionform'
    #     },
    #     'redirect': '/form/base-form',
    #     'component': 'RouteView'
    # },
    # {
    #     'name': 'basic-form',
    #     'parentId': 10,
    #     'id': 6,
    #     'meta': {
    #         'title': 'menu.form.basic-form'
    #     },
    #     'component': 'BasicForm'
    # },
    # {
    #     'name': 'step-form',
    #     'parentId': 10,
    #     'id': 5,
    #     'meta': {
    #         'title': 'menu.form.step-form'
    #     },
    #     'component': 'StepForm'
    # },
    # {
    #     'name': 'advanced-form',
    #     'parentId': 10,
    #     'id': 4,
    #     'meta': {
    #         'title': 'menu.form.advanced-form'
    #     },
    #     'component': 'AdvanceForm'
    # },
    # {
    #     'name': 'list',
    #     'parentId': 0,
    #     'id': 10010,
    #     'meta': {
    #         'icon': 'table',
    #         'title': 'menu.list',
    #         'show': True
    #     },
    #     'redirect': '/list/table-list',
    #     'component': 'RouteView'
    # },
    # {
    #     'name': 'table-list',
    #     'parentId': 10010,
    #     'id': 10011,
    #     'path': '/list/table-list/:pageNo([1-9]\\d*)?',
    #     'meta': {
    #         'title': 'menu.list.table-list',
    #         'show': True
    #     },
    #     'component': 'TableList'
    # },
    # {
    #     'name': 'basic-list',
    #     'parentId': 10010,
    #     'id': 10012,
    #     'meta': {
    #         'title': 'menu.list.basic-list',
    #         'show': True
    #     },
    #     'component': 'StandardList'
    # },
    # {
    #     'name': 'card',
    #     'parentId': 10010,
    #     'id': 10013,
    #     'meta': {
    #         'title': 'menu.list.card-list',
    #         'show': True
    #     },
    #     'component': 'CardList'
    # },
    # {
    #     'name': 'search',
    #     'parentId': 10010,
    #     'id': 10014,
    #     'meta': {
    #         'title': 'menu.list.search-list',
    #         'show': True
    #     },
    #     'redirect': '/list/search/article',
    #     'component': 'SearchLayout'
    # },
    # {
    #     'name': 'article',
    #     'parentId': 10014,
    #     'id': 10015,
    #     'meta': {
    #         'title': 'menu.list.search-list.articles',
    #         'show': True
    #     },
    #     'component': 'SearchArticles'
    # },
    # {
    #     'name': 'project',
    #     'parentId': 10014,
    #     'id': 10016,
    #     'meta': {
    #         'title': 'menu.list.search-list.projects',
    #         'show': True
    #     },
    #     'component': 'SearchProjects'
    # },
    # {
    #     'name': 'application',
    #     'parentId': 10014,
    #     'id': 10017,
    #     'meta': {
    #         'title': 'menu.list.search-list.applications',
    #         'show': True
    #     },
    #     'component': 'SearchApplications'
    # },
    # {
    #     'name': 'profile',
    #     'parentId': 0,
    #     'id': 10018,
    #     'meta': {
    #         'title': 'menu.profile',
    #         'icon': 'profile',
    #         'show': True
    #     },
    #     'redirect': '/profile/basic',
    #     'component': 'RouteView'
    # },
    # {
    #     'name': 'basic',
    #     'parentId': 10018,
    #     'id': 10019,
    #     'meta': {
    #         'title': 'menu.profile.basic',
    #         'show': True
    #     },
    #     'component': 'ProfileBasic'
    # },
    # {
    #     'name': 'advanced',
    #     'parentId': 10018,
    #     'id': 10020,
    #     'meta': {
    #         'title': 'menu.profile.advanced',
    #         'show': True
    #     },
    #     'component': 'ProfileAdvanced'
    # },
    # {
    #     'name': 'result',
    #     'parentId': 0,
    #     'id': 10021,
    #     'meta': {
    #         'title': 'menu.result',
    #         'icon': 'check-circle-o',
    #         'show': True
    #     },
    #     'redirect': '/result/success',
    #     'component': 'PageView'
    # },
    # {
    #     'name': 'success',
    #     'parentId': 10021,
    #     'id': 10022,
    #     'meta': {
    #         'title': 'menu.result.success',
    #         'hiddenHeaderContent': True,
    #         'show': True
    #     },
    #     'component': 'ResultSuccess'
    # },
    # {
    #     'name': 'fail',
    #     'parentId': 10021,
    #     'id': 10023,
    #     'meta': {
    #         'title': 'menu.result.fail',
    #         'hiddenHeaderContent': True,
    #         'show': True
    #     },
    #     'component': 'ResultFail'
    # },
    # {
    #     'name': 'exception',
    #     'parentId': 0,
    #     'id': 10024,
    #     'meta': {
    #         'title': 'menu.exception',
    #         'icon': 'warning',
    #         'show': True
    #     },
    #     'redirect': '/exception/403',
    #     'component': 'RouteView'
    # },
    # {
    #     'name': '403',
    #     'parentId': 10024,
    #     'id': 10025,
    #     'meta': {
    #         'title': 'menu.exception.not-permission',
    #         'show': True
    #     },
    #     'component': 'Exception403'
    # },
    # {
    #     'name': '404',
    #     'parentId': 10024,
    #     'id': 10026,
    #     'meta': {
    #         'title': 'menu.exception.not-find',
    #         'show': True
    #     },
    #     'component': 'Exception404'
    # },
    # {
    #     'name': '500',
    #     'parentId': 10024,
    #     'id': 10027,
    #     'meta': {
    #         'title': 'menu.exception.server-error',
    #         'show': True
    #     },
    #     'component': 'Exception500'
    # },
    {
        'name': 'account',
        'parentId': 0,
        'id': 10028,
        'meta': {
            'title': 'menu.account',
            'icon': 'user',
            'show': False
        },
        'redirect': '/account/center',
        'component': 'RouteView'
    },
    {
        'name': 'center',
        'parentId': 10028,
        'id': 10029,
        'meta': {
            'title': 'menu.account.center',
            'show': True
        },
        'component': 'AccountCenter'
    },
    {
        'name': 'settings',
        'parentId': 10028,
        'id': 10030,
        'meta': {
            'title': 'menu.account.settings',
            'hideHeader': True,
            'hideChildren': True,
            'show': True
        },
        'redirect': '/account/settings/basic',
        'component': 'AccountSettings'
    },
    {
        'name': 'BasicSettings',
        'path': '/account/settings/basic',
        'parentId': 10030,
        'id': 10031,
        'meta': {
            'title': 'account.settings.menuMap.basic',
            'show': False
        },
        'component': 'BasicSetting'
    },
    {
        'name': 'SecuritySettings',
        'path': '/account/settings/security',
        'parentId': 10030,
        'id': 10032,
        'meta': {
            'title': 'account.settings.menuMap.security',
            'show': False
        },
        'component': 'SecuritySettings'
    },
    {
        'name': 'CustomSettings',
        'path': '/account/settings/custom',
        'parentId': 10030,
        'id': 10033,
        'meta': {
            'title': 'account.settings.menuMap.custom',
            'show': False
        },
        'component': 'CustomSettings'
    },
    {
        'name': 'BindingSettings',
        'path': '/account/settings/binding',
        'parentId': 10030,
        'id': 10034,
        'meta': {
            'title': 'account.settings.menuMap.binding',
            'show': False
        },
        'component': 'BindingSettings'
    },
    {
        'name': 'NotificationSettings',
        'path': '/account/settings/notification',
        'parentId': 10030,
        'id': 10035,
        'meta': {
            'title': 'account.settings.menuMap.notification',
            'show': False
        },
        'component': 'NotificationSettings'
    }
]