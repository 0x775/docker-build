#!/bin/bash
#docker run -d --name php-fpm --link redis:redis -p 9000:9000 -v /Users/ph4nf4n/docker/api.xnongren.com/www:/www php-fpm
docker run -d --name php-fpm --link redis:redis -P -v /Users/ph4nf4n/docker/www:/www php-fpm
