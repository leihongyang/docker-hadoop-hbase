#!/bin/bash

service ssh start
echo -e "\n"

sleep 60

$HBASE_HOME/bin/start-hbase.sh

echo -e "\n"

tailf $HBASE_HOME/logs/hbase--master-hbase-master.log
#$HADOOP_HOME/sbin/start-yarn.sh

#echo -e "\n"

