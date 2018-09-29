#!/bin/bash

service ssh start

echo -e "\n"

tailf $HADOOP_HOME/logs/hadoop-root-*

