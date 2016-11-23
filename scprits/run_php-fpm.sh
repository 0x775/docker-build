#!/bin/bash
docker run -d --name php-fpm --link redis:redis -p 9000:9000 -v /Users/ph4nf4n/Docker/virtual/www:/www php-fpm:5.6
