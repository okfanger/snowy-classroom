

## 1. 后端部分运行

### 1.1 第一次部署
进入项目目录 
```bash
cd exam-auto-judege
```


创建虚拟环境
```bash
python -m venv env
```

进入/激活 当前虚拟环境
```bash
env\scripts\activate
```

根据依赖列表安装
```bash
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 1.2 正常运行项目

进入/激活 当前虚拟环境
```bash
env\scripts\activate
```

运行项目，并绑定到 8032端口（因为前端的proxy挂的也是本地的8032端口）
```bash
python manager.py runserver 127.0.0.1:8032
```


## 2. 前端运行

### 2.1 第一次部署
进入项目目录 
```bash
cd exam-auto-judege
cd front
```

安装yarn （如果之前没有安装过的话）
```bash
npm i -g yarn
```

使用yarn安装前端依赖
```bash
yarn install
```
### 2.2 运行前端项目

```bash
yarn run serve
```