#!/bin/bash
#docker run -d --name php-fpm --link redis:redis -p 9000:9000 -v /Users/apple/docker/api.xnong.com/www:/www php-fpm
docker run -d --name php-fpm --link redis:redis -P -v /Users/apple/docker/www:/www php-fpm
