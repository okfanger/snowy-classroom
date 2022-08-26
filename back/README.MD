
# ExamAutoJudge 后端

创建虚拟环境
```bash
python -m venv venv
```

激活虚拟环境

```bash
.\venv\Scripts\activate
```


安装依赖：
```bash
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```


运行项目

```bash
python manage.py runserver
```

数据库迁移

```bash
python manage.py makemigrations
python manage.py migrate
```