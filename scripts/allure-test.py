import os, sys
sys.path.append(os.getcwd())
from back.settings import BASE_DIR
allure_tmp_dir = os.path.join(BASE_DIR, "tests", "allure-results")
os.system("del /s /q %s/*.*" % allure_tmp_dir)
os.system(f"pytest --alluredir={allure_tmp_dir}")
os.system(f"allure serve {allure_tmp_dir}")