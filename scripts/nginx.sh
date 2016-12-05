#!/bin/bash
#docker run -d --name api-xnongren -p 80:80 --link php-fpm:php-fpm -v /Users/ph4nf4n/docker/api.xnongren.com/www:/www -v /Users/ph4nf4n/docker/api.xnongren.com/nginx.conf:/etc/nginx/nginx.conf nginx
docker run -d --name web -p 80:80 --link php-fpm:php-fpm -v /Users/ph4nf4n/docker/www:/www -v /Users/ph4nf4n/docker/site-enabled/nginx:/etc/nginx/nginx.conf -v /Users/ph4nf4n/docker/site-enabled:/etc/nginx/site-enabled nginx
