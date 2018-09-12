#!/bin/sh
hadoopFile='hadoop-3.1.1.tar.gz'
if [ ! -f "$hadoopFile" ]; then
echo 'wget hadoop-3.1.1'
wget http://mirrors.hust.edu.cn/apache/hadoop/common/hadoop-3.1.1/hadoop-3.1.1.tar.gz
fi
javaFile='jdk-8u181-linux-x64.tar.gz'
if [ ! -f "$javaFile" ]; then
echo 'wget jdk1.8_181'
wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
fi
docker build -t kycloud/hadoop:1.0.0 .
