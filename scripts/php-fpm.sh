#!/bin/bash
docker run -d --name php-fpm --link redis:redis -P -v /Users/apple/docker/www:/www php-fpm
