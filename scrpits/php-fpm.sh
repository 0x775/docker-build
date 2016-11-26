#!/bin/bash
docker run -d --name php-fpm --link redis:redis -p 9000:9000 -v /vagrant/api.xnongren.com/www:/www php-fpm
