# build cdh environment on hibench-base

#FROM hibench-base
FROM hibench-base-2

USER root

#==============================
# CDH Installation
#==============================

## CDH version 4 or 5
#ENV CDH_VERSION 5
#
##Add the CDH 5 repository
#COPY conf/cloudera.list /etc/apt/sources.list.d/cloudera.list
##Set preference for cloudera packages
#COPY conf/cloudera.pref /etc/apt/preferences.d/cloudera.pref
#
##Add a Repository Key
#RUN wget http://archive.cloudera.com/cdh${CDH_VERSION}/ubuntu/trusty/amd64/cdh/archive.key -O archive.key && sudo apt-key add archive.key 
#RUN apt-get update
#
## install hadoop-yarn
#RUN apt-get -y install hadoop-conf-pseudo
#
## install spark
#RUN apt-get -y install spark-core spark-history-server spark-python
#
## set environment variables
#ENV HADOOP_CONF_DIR /etc/hadoop/conf
#ENV HADOOP_HOME /usr/lib/hadoop
#ENV HADOOP_PREFIX /usr/lib/hadoop
#ENV HIVE_CONF_DIR /etc/hive/conf
#ENV SPARK_HOME /usr/lib/spark
#
##Copy updated config files
#COPY conf/core-site.xml /etc/hadoop/conf/core-site.xml
#COPY conf/hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml
#COPY conf/mapred-site.xml /etc/hadoop/conf/mapred-site.xml
#COPY conf/yarn-site.xml /etc/hadoop/conf/yarn-site.xml
#COPY scripts/hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh
#
##Format HDFS
#COPY scripts/bootstrap.sh /usr/bin/bootstrap.sh
#RUN chmod +x /usr/bin/bootstrap.sh


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
## entrypoint by launching cluster
#CMD ["/usr/bin/bootstrap.sh"]


##==============================
## Maven Installation
##==============================
#
## Maven version 4 or 5
#ENV MAVEN_VERSION 3.1.0
#
## download maven
#RUN wget https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/${MAVEN_VERSION}/apache-maven-${MAVEN_VERSION}-bin.tar.gz
#RUN tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz
#RUN rm -f apache-maven-${MAVEN_VERSION}-bin.tar.gz
#RUN mv apache-maven-* /usr/local/apache-maven
#
## define environment variables for maven
#ENV M2_HOME /usr/local/apache-maven
#ENV PATH $PATH:/usr/local/apache-maven/bin


#==============================
# CDH Installation
#==============================

# cdh/hadoop/spark version
ENV CDH_GLOBAL 5
ENV CDH_VERSION ${CDH_GLOBAL}.4.0
ENV HADOOP_VERSION 2.6.0
ENV SPARK_VERSION 1.3.0

# environment variables
ENV HADOOP_HOME /usr/local/hadoop-${HADOOP_VERSION}-cdh${CDH_VERSION}
ENV HADOOP_PREFIX /usr/local/hadoop-${HADOOP_VERSION}-cdh${CDH_VERSION}
ENV HADOOP_CONF_DIR ${HADOOP_HOME}/etc/hadoop/
#ENV HIVE_CONF_DIR /etc/hive/conf
ENV SPARK_HOME /usr/local/spark-${SPARK_VERSION}-cdh${CDH_VERSION}

# download cdh packages
RUN wget http://archive.cloudera.com/cdh${CDH_GLOBAL}/cdh/${CDH_GLOBAL}/hadoop-${HADOOP_VERSION}-cdh${CDH_VERSION}.tar.gz
RUN tar xzf hadoop-*.tar.gz -C /usr/local
#mv /usr/loca/hadoop-* ${HADOOP_HOME}
RUN rm -f hadoop-*.tar.gz 

RUN wget http://archive.cloudera.com/cdh${CDH_GLOBAL}/cdh/${CDH_GLOBAL}/spark-${SPARK_VERSION}-cdh${CDH_VERSION}.tar.gz
RUN tar xzf spark-*.tar.gz -C /usr/local
#mv /usr/loca/spark-* ${SPARK_HOME}
RUN rm -f spark-*.tar.gz 

#Copy updated config files
COPY conf/core-site.xml ${HADOOP_CONF_DIR}/core-site.xml
COPY conf/hdfs-site.xml ${HADOOP_CONF_DIR}/hdfs-site.xml
COPY conf/mapred-site.xml ${HADOOP_CONF_DIR}/mapred-site.xml
COPY conf/yarn-site.xml ${HADOOP_CONF_DIR}/yarn-site.xml
COPY scripts/hadoop-env.sh ${HADOOP_CONF_DIR}/hadoop-env.sh

# start hadoop/spark
RUN ${HADOOP_HOME}/sbin/start-all.sh
RUN ${SPARK_HOME}/sbin/start-all.sh


#==============================
# Ports to listen
#==============================

# NameNode (HDFS)
EXPOSE 8020 50070

# DataNode (HDFS)
EXPOSE 50010 50020 50075

# ResourceManager (YARN)
EXPOSE 8030 8031 8032 8033 8088

# NodeManager (YARN)
EXPOSE 8040 8042

