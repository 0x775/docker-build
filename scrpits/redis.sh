#!/bin/bash
docker run -d --name redis -p 6379:6379 -v /vagrant/data/redis:/data redis
