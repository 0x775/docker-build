使用163的镜像
docker pull hub.c.163.com/library/redis:3.2.5-alpine
docker run --name some-redis -d -v /docker/host/dir:/data redis:3.2.5-alpine
