import os

if os.path.exists("db.sqlite3"):
    os.remove("db.sqlite3")

os.system("python manage.py makemigrations"
          "& python manage.py migrate"
          "& python manage.py init default"
          "& python manage.py runserver 127.0.0.1:8032")