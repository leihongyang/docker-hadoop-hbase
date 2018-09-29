#!/bin/bash

service ssh start
echo -e "\n"

mkdir $HBASE_HOME/logs

tailf $HBASE_HOME/logs/*

