#!/bin/sh
docker run -itd -p 50070:50070 -p 8088:8088 --name hadoop-master --hostname hadoop-master kycloud/hadoop:1.0.0 &> /dev/null
