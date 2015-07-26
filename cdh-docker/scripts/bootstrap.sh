#!/bin/bash

hdfs namenode -format

mkdir -p /var/lib/hadoop-hdfs/cache/root/
mkdir -p /var/lib/hadoop-hdfs/cache/root/name
mkdir -p /var/lib/hadoop-hdfs/cache/root/namesecondary
mkdir -p /var/lib/hadoop-hdfs/cache/root/data
chmod -R 1777 /var/lib/hadoop-hdfs/

# start hadoop nodes
service hadoop-hdfs-namenode start
service hadoop-hdfs-datanode start

#sudo -u hdfs hadoop fs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
hadoop fs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
#hadoop fs -chown -R mapred:mapred /tmp/hadoop-yarn/staging
hadoop fs -chmod -R 1777 /tmp
hadoop fs -mkdir -p /var/log/hadoop-yarn
hadoop fs -chown yarn:mapred /var/log/hadoop-yarn

# start yarn
service hadoop-yarn-resourcemanager start
service hadoop-yarn-nodemanager start
service hadoop-mapreduce-historyserver start

hadoop fs -mkdir -p /user/hdfs
#hadoop fs -chown hdfs /user/hdfs

# start spark-history-server
hadoop fs -mkdir /user/spark
hadoop fs -mkdir /user/spark/applicationHistory 
#hadoop fs -chown -R spark:spark /user/spark
hadoop fs -chmod 1777 /user/spark/applicationHistory

service spark-history-server start
