#!/bin/bash

service ssh start
echo -e "\n"

tailf $HBASE_HOME/logs/hbase--master-hbase-master.log

