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
sql = 'select * from users_user where username = 2020122104559'

# 有返回值（查）
# 没返回值（增删改）

# try - except - finally
# 相当于 java 里的 try - catch - finally
try:
    s = cur.execute(sql)
    res = s.fetchone()

    name, pid, tel = res[3], res[4], res[-3]
    print(name, pid, tel)
    # print(res)

except Exception as e:
    print(e)

sql = 'delete from users_user where id=114'
try:
    s = cur.execute(sql)
    con.commit()
    if s.rowcount == 1:
        print("删除成功！")
    else:
        print("删除失败")
        con.rollback()
except Exception as e:
    print(e)


sql = 'update users_user set name=? where id=104'
try:
    s = cur.execute(sql, ("George",))
    con.commit()
    if s.rowcount == 1:
        print("修改成功！")
    else:
        print("修改失败")
        con.rollback()
except Exception as e:
    print(e)


sql = 'insert into users_user values' \
      "(999, '2022-10-21 08:58:09.684063', '2022-10-21 08:58:09.751159', 'yyds', '2021122104559', '827ccb0eea8a706c4c34a16891f84e7b', 'admin333@qq.com', '18993999999', 1, 3)"
try:
    s = cur.execute(sql)
    con.commit()
    if s.rowcount == 1:
        print("添加成功！")
    else:
        print("添加失败")
        con.rollback()
except Exception as e:
    print(e)

cur.close()
# 关闭连接
con.close()
