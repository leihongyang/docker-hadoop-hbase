#!/bin/bash

service ssh start
echo -e "\n"

tailf $HBASE_HOME/conf/hbase-site.xml

