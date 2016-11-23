#!/bin/bash
docker run -d --name web-dev2 -p 80:80 --link php-fpm:php-fpm -v /Users/ph4nf4n/Docker/virtual/www:/www -v /Users/ph4nf4n/Docker/virtual/www/nginx.conf:/etc/nginx/nginx.conf nginx:1.6
