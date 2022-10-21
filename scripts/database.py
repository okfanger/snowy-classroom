# 导入sqllite3模块
import sqlite3
# 数据库 sqlite3 （文件型数据库）
# python 默认支持
# 房车（文件）
# mysql / sqlserver（搬家公司）
# 1.硬盘上创建连接
con = sqlite3.connect('../db.sqlite3')

# 获取cursor对象（游标）
cur = con.cursor()
# 执行sql创建表
sql = ''

# try - except - finally
# 相当于 java 里的 try - catch - finally
try:
    cur.execute(sql)
except Exception as e:
    print(e)
finally:
    # 关闭游标
    cur.close()
    # 关闭连接
    con.close()
