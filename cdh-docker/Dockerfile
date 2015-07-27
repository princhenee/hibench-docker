# build cdh environment on hibench-base

#FROM hibench-base
FROM hibench-cdh

MAINTAINER kevin chen <ge.chen@intel.com>
USER root


##==============================
## CDH Installation
##==============================
#
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
#RUN hdfs namenode -format
#
#COPY scripts/bootstrap.sh /usr/bin/bootstrap.sh
#RUN chmod +x /usr/bin/bootstrap.sh


# install maven
RUN mkdir -p /tmp
RUN wget -O /tmp/maven.tar.gz http://www.eng.lsu.edu/mirrors/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
RUN cd /tmp; tar xzf maven.tar.gz

RUN mv /tmp/apache-maven-* /usr/local/maven
RUN echo -e "export M2_HOME=/usr/local/maven\nexport PATH=$M2_HOME/bin:$PATH" > /etc/init.d/maven.sh
RUN source /etc/init.d/maven.sh
RUN \
  if [ -f /tmp/settings.xml ]; then \
    mkdir -p /root/.m2; mv /tmp/settings.xml /root/.m2/ \
  fi


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
