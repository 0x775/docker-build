#!/bin/bash
docker run -d --name web -p 80:80 --link php-fpm:php-fpm -v /Users/apple/docker/www:/www -v /Users/apple/docker/site-enabled/nginx:/etc/nginx/nginx.conf -v /Users/apple/docker/site-enabled:/etc/nginx/site-enabled nginx
