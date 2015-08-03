# build cdh environment on hibench-base

#FROM hibench-base
FROM hibench-base-2

USER root

RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN service ssh restart

#==============================
# HADOOP Installation
#==============================

# hadoop version
ENV HADOOP_VERSION 2.6.0

# environment variables
ENV HADOOP_HOME /usr/local/hadoop-${HADOOP_VERSION}
ENV HADOOP_PREFIX /usr/local/hadoop-${HADOOP_VERSION}
ENV HADOOP_CONF_DIR ${HADOOP_HOME}/etc/hadoop/

RUN export HADOOP_INSTALL=$HADOOP_HOME
RUN export PATH=$PATH:$HADOOP_INSTALL/bin
RUN export PATH=$PATH:$HADOOP_INSTALL/sbin
RUN export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
RUN export HADOOP_COMMON_HOME=$HADOOP_INSTALL
RUN export HADOOP_HDFS_HOME=$HADOOP_INSTALL
RUN export YARN_HOME=$HADOOP_INSTALL
RUN export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
RUN export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"

RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz
#COPY hadoop-2.6.0.tar.gz /hadoop-2.6.0.tar.gz
RUN tar xzf hadoop-*.tar.gz -C /usr/local
RUN mv /usr/local/hadoop-* ${HADOOP_HOME}
RUN rm -f hadoop-*.tar.gz 


#==============================
# SPARK Installation
#==============================

# spark version
ENV SPARK_VERSION 1.3.0
ENV HADOOP_FOR_SPARK_VERSION 2.4
ENV SPARK_HOME /usr/local/spark-${SPARK_VERSION}

# download spark
RUN wget http://mirror.reverse.net/pub/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_FOR_SPARK_VERSION}.tgz 
#COPY spark-1.3.0-bin-hadoop2.4.tgz /spark-1.3.0.tgz
RUN tar xzf spark-*.tgz -C /usr/local
mv /usr/local/spark-* ${SPARK_HOME}
RUN rm -f spark-*.tgz 

#Copy updated config files
COPY conf/core-site.xml ${HADOOP_CONF_DIR}/core-site.xml
COPY conf/hdfs-site.xml ${HADOOP_CONF_DIR}/hdfs-site.xml
COPY conf/mapred-site.xml ${HADOOP_CONF_DIR}/mapred-site.xml
COPY conf/yarn-site.xml ${HADOOP_CONF_DIR}/yarn-site.xml
COPY scripts/hadoop-env.sh ${HADOOP_CONF_DIR}/hadoop-env.sh

# makdir for hdfs storage
RUN mkdir -p /usr/local/hadoop_store/hdfs/namenode
RUN mkdir -p /usr/local/hadoop_store/hdfs/datanode

# start hadoop/spark
#RUN ${HADOOP_HOME}/sbin/start-all.sh
#RUN ${SPARK_HOME}/sbin/start-all.sh


##==============================
## Ports to listen
##==============================
#
## NameNode (HDFS)
#EXPOSE 8020 50070
#
## DataNode (HDFS)
#EXPOSE 50010 50020 50075
#
## ResourceManager (YARN)
#EXPOSE 8030 8031 8032 8033 8088
#
## NodeManager (YARN)
#EXPOSE 8040 8042
#
