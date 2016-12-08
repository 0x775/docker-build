#!/bin/bash
docker run -d --name redis -p 6379:6379 -v /Users/apple/docker/data/redis:/data redis
