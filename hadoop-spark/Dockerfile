# build cdh environment on hibench-base

FROM hibench-base

USER root

#==============================
# HADOOP Installation
#==============================

# hadoop version
ENV HADOOP_VERSION hadoop2
ENV HADOOP_VERSION_DETAIL 2.6.0

# environment variables for HADOOP
ENV HADOOP_HOME /usr/local/hadoop-${HADOOP_VERSION_DETAIL}
ENV HADOOP_PREFIX /usr/local/hadoop-${HADOOP_VERSION_DETAIL}
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

#RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-${HADOOP_VERSION_DETAIL}/hadoop-${HADOOP_VERSION_DETAIL}.tar.gz
COPY hadoop-2.6.0.tar.gz /
RUN tar xzf hadoop-*.tar.gz -C /usr/local/
#RUN mv /usr/local/hadoop-* ${HADOOP_HOME}
RUN rm -f hadoop-*.tar.gz 


#==============================
# SPARK Installation
#==============================

# spark version
ENV SPARK_VERSION spark1.3
ENV SPARK_VERSION_DETAIL 1.3.0
ENV HADOOP_FOR_SPARK_VERSION 2.4
ENV SPARK_HOME /usr/local/spark-${SPARK_VERSION_DETAIL}
ENV SPARK_MASTER_IP localhost

# download spark
#RUN wget http://mirror.reverse.net/pub/apache/spark/spark-${SPARK_VERSION_DETAIL}/spark-${SPARK_VERSION_DETAIL}-bin-hadoop${HADOOP_FOR_SPARK_VERSION}.tgz 
COPY spark-1.3.0-bin-hadoop2.4.tgz /
RUN tar xzf spark-*.tgz -C /usr/local
RUN mv /usr/local/spark-* ${SPARK_HOME}
RUN rm -f spark-*.tgz 

#Copy updated config files
COPY conf/core-site.xml ${HADOOP_CONF_DIR}/
COPY conf/hdfs-site.xml ${HADOOP_CONF_DIR}/
COPY conf/mapred-site.xml ${HADOOP_CONF_DIR}/
COPY conf/yarn-site.xml ${HADOOP_CONF_DIR}/
COPY conf/hadoop-env.sh ${HADOOP_CONF_DIR}/
COPY scripts/restart-hadoop-spark.sh /root/
RUN chmod +x /root/restart-hdfs.sh

# start HADOOP/SPARK
CMD bash -C '/root/restart-hadoop-spark.sh'; 'bash'
