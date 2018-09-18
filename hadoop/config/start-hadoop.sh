#!/bin/bash

service ssh start

$HADOOP_HOME/sbin/stop-dfs.sh

service ssh restart

echo -e "\n"

$HADOOP_HOME/sbin/start-dfs.sh

echo -e "\n"

#tailf $HADOOP_HOME/logs/hadoop-root-namenode-hadoop-master.log
tailf $HADOOP_HOME/logs/hadoop-root-*
#$HADOOP_HOME/sbin/start-yarn.sh

#echo -e "\n"

