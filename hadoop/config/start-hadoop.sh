#!/bin/bash

service ssh start
echo -e "\n"

$HADOOP_HOME/sbin/start-dfs.sh

echo -e "\n"

tailf $HADOOP_HOME/logs/hadoop-root-namenode-hadoop-master.log
#$HADOOP_HOME/sbin/start-yarn.sh

#echo -e "\n"

