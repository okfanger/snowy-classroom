import os

if os.path.exists("db.sqlite3"):
    os.remove("db.sqlite3")

os.system("python manage.py makemigrations"
          "& python manage.py migrate"
          "& python manage.py init route"
          "& python manage.py init example"
          "& python manage.py init student"
          "& python manage.py init teacher"
          "& python manage.py init admin"
          "& python manage.py runserver 127.0.0.1:8032")