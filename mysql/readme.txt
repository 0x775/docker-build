使用163的镜像
docker pull hub.c.163.com/library/mysql:5.5.53
docker run --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d -v /some_path/mysql-data:/var/lib/mysql mysql:5.5.53
