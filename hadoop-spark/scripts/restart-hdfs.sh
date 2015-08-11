# restart ssh service
service ssh restart

# stop process
${HADOOP_HOME}/sbin/stop-dfs.sh
${HADOOP_HOME}/sbin/stop-yarn.sh

# clear data directories
mkdir -p /usr/local/hdfs/namenode/
mkdir -p /usr/local/hdfs/datanode/
rm -fr /usr/local/hdfs/namenode/*
rm -fr /usr/local/hdfs/datanode/*

# remove related logs
rm -fr ${HADOOP_HOME}/logs/hadoop-root-name*
rm -fr ${HADOOP_HOME}/logs/hadoop-root-data*
rm -fr ${HADOOP_HOME}/logs/hadoop-root-second*

# hdfs format
${HADOOP_HOME}/bin/hdfs namenode -format

# restart hdfs
${HADOOP_HOME}/sbin/start-dfs.sh
# restart yarn
${HADOOP_HOME}/sbin/start-yarn.sh

