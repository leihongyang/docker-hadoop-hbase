#!/bin/sh
docker pull ubuntu:16.04
cd hadoop
./build-image.sh
cp jdk-* ../hbase/
cd ../hbase
./build-image.sh
