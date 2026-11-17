# 修改密码 -- docker版

```shell
# 1. 登录 MySQL（mysql 替换为容器名，提示后输入旧密码）
docker exec -it mysql mysql -uroot -p

# 2. 查看 root 账号的 Host
SELECT User, Host FROM mysql.user WHERE User = 'root';

# 3. 按查询结果修改密码；两条记录都存在且都需要修改时，执行两条
ALTER USER 'root'@'%' IDENTIFIED BY '你的新密码';
ALTER USER 'root'@'localhost' IDENTIFIED BY '你的新密码';

# 退出；密码立即生效，无需重启容器
exit;
```
