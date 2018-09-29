#!/bin/bash

service ssh start

rm -rf ~/hdfs/datanode/*

echo -e "\n"

tailf $HADOOP_HOME/logs/hadoop-root-*

