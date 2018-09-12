#!/bin/sh
docker run -itd -p 16010:16010 --name hbase-master --hostname hbase-master kycloud/hbase:1.0.0 &> /dev/null
#hadoopMasterIP=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' hadoop-master`
#docker exec -it hbase-master sed '2i'${hadoopMasterIP}'     hadoop-master' /etc/hosts
