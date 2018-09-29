#!/bin/bash

service ssh start

rm -rf ~/hdfs/datanode/*

echo -e "\n"

mkdir $HADOOP_HOME/logs

tailf $HADOOP_HOME/logs/*

