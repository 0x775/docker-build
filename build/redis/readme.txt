使用163的镜像
docker pull hub.c.163.com/library/redis:3.2.5-alpine
docker run --name some-redis -d -v /docker/host/dir:/data redis:3.2.5-alpine



使用alpine镜像
#docker pull redis:alpine
#docker run -itd --name redisServer -p 6379:6379 redis:alpine --requirepass 密码
