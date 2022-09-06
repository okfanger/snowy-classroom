


### lookup_expr的种类

 - exact：精确匹配，大小写匹配
 - iexact：精确匹配，并忽略大小写
 - lt：小于
 - gt：大于
 - lte：小于等于
 - gte：大于等于
 - startswith：以...开始
 - endswith：以...结束
 - contains：包含
 - icontains：模糊包含
 - not_contains：不包含
 
 
 ### filters类的定义
 
 ```python
import django_filters

class ProductFilter(django_filters.FilterSet):
    class Meta:
        model = Product
        fields = {
            'price': ['lt', 'gt'],
            'release_date': ['exact', 'year__gt'],
        }
```
 