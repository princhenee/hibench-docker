#!/bin/bash

# start ssh service
service ssh restart

# remove existing data directories
rm -fr /var/lib/hadoop-hdfs/*
sudo -u hdfs hdfs namenode -format

sudo -u hdfs chmod -R 777 /var/lib/hadoop-hdfs

# start hadoop nodes
service hadoop-hdfs-namenode restart
service hadoop-hdfs-datanode restart

#sudo -u hdfs hdfs dfs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
hdfs dfs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
hdfs dfs -chown -R mapred:mapred /tmp/hadoop-yarn/staging
hdfs dfs -chmod -R 1777 /tmp
hdfs dfs -mkdir -p /var/log/hadoop-yarn
hdfs dfs -chown yarn:mapred /var/log/hadoop-yarn

# start yarn
service hadoop-yarn-resourcemanager restart
service hadoop-yarn-nodemanager restart
service hadoop-mapreduce-historyserver restart

hdfs dfs -mkdir -p /user/hdfs
hdfs dfs -chown hdfs:hdfs /user/hdfs

# start spark-history-server
hdfs dfs -mkdir -p /user/spark/applicationHistory 
hdfs dfs -chown -R spark:spark /user/spark
hdfs dfs -chmod 1777 /user/spark/applicationHistory

service spark-history-server restart
${SPARK_HOME}/sbin/stop-all.sh
${SPARK_HOME}/sbin/start-all.sh

echo "#=======================================================#"
echo "      ALL services started                               "
echo "#=======================================================#"

