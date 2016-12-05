#!/bin/bash
docker run -d --name redis -p 6379:6379 -v /Users/ph4nf4n/docker/data/redis:/data redis
