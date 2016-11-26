#!/bin/bash
docker run -d --name api-xnongren -p 80:80 --link php-fpm:php-fpm -v /vagrant/api.xnongren.com/www:/www -v /vagrant/api.xnongren.com/nginx.conf:/etc/nginx/nginx.conf nginx
