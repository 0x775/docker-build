#!/bin/bash
docker run -d --name redis -p 6379:6379 -v /Users/ph4nf4n/Docker/virtual/data/redis:/data redis:3.2.5
