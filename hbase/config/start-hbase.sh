#!/bin/bash

service ssh start
echo -e "\n"

sleep 180

$HBASE_HOME/bin/start-hbase.sh

echo -e "\n"

hbase-daemon.sh start thrift2
#tailf $HBASE_HOME/logs/hbase--master-hbase-master.log
#$HADOOP_HOME/sbin/start-yarn.sh

#echo -e "\n"

