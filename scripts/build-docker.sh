#!/bin/bash


CUR_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
HOME_DIR=${CUR_DIR}/..


echo "============================================"
echo "   Start building hibench-base image...     "
echo "============================================"
mkdir -p ${HOME_DIR}/base/conf/
cp ${HOME_DIR}/conf/HiBench-v4.0/* ${HOME_DIR}/base/conf/
sudo docker build -t hibench-base ${HOME_DIR}/base/
rm -fr ${HOME_DIR}/base/conf/


echo "============================================"
echo "   Start building hibench-docker image...    "
echo "============================================"
mkdir -p ${HOME_DIR}/hadoop-spark/conf/
mkdir -p ${HOME_DIR}/hadoop-spark/scripts/
cp ${HOME_DIR}/conf/hadoop-conf/* ${HOME_DIR}/hadoop-spark/conf/
cp ${HOME_DIR}/scripts/hadoop-spark-scripts/* ${HOME_DIR}/hadoop-spark/scripts/
sudo docker build -t hibench-docker ${HOME_DIR}/hadoop-spark/
rm -fr ${HOME_DIR}/hadoop-spark/conf/
rm -fr ${HOME_DIR}/hadoop-spark/scripts/

