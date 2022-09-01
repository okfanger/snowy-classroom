from django.apps import AppConfig

default_app_config = 'apps.bases.BaseConfig'
VERBOSE_APP_NAME = u"基础管理"


class BaseConfig(AppConfig):
    name = 'apps.bases'
    verbose_name = VERBOSE_APP_NAME
    main_menu_index = 1