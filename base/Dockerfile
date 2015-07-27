# build environment on ubuntu14.04

FROM ubuntu:14.04
#FROM hibench-jdk

MAINTAINER kevin chen <ge.chen@intel.com>
USER root

## add proxy config inside FIREWALL
#ENV http_proxy="http://child-prc.intel.com:913"
#ENV https_proxy="http://child-prc.intel.com:913"
#ENV HTTP_PROXY="http://child-prc.intel.com:913"
#ENV HTTPS_PROXY="http://child-prc.intel.com:913"

#==============================
# System Basic Tools  Installation
#==============================

# install basic build environment
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y git wget curl man unzip vim-tiny && \

# compilers and basic tools
  apt-get install -y gfortran make gcc 

# install ssh server
RUN apt-get -y install openssh-server; mkdir -p /var/run/sshd; locale-gen en_US en_US.UTF-8

# passwordless ssh
RUN rm -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN rm -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


#==============================
# Python Installation
#==============================

# python version at least 2.6
ENV PYTHON_VERSION 2.7 

# install python
RUN apt-get install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-dev

# pip
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py; python get-pip.py; rm -f /get-pip.py

# install numpy and matplotlib
RUN apt-get install -y python-numpy python-matplotlib


#==============================
# Java Installation
#==============================

# jdk-version
ENV JDK_VERSION 6

# Install Java
RUN \
  echo oracle-java${JDK_VERSION}-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java${JDK_VERSION}-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk${JDK_VERSION}-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-${JDK_VERSION}-oracle
ENV PATH $PATH:$JAVA_HOME/bin


#==============================
# Scala Installation
#==============================

# export scala variables
ENV SCALA_VERSION 2.10.4
ENV SCALA_HOME /usr/local/scala

# Download and extract scala${SCALA_VERSION}
RUN /usr/bin/wget \
  http://scala-lang.org/files/archive/scala-${SCALA_VERSION}.tgz \
    -P /tmp && tar -xzf /tmp/scala-${SCALA_VERSION}.tgz -C /usr/local/ && rm -rf /tmp/*

# change the default scala_home name
RUN mv /usr/local/scala-${SCALA_VERSION} /usr/local/scala

# add scala path
ENV PATH $PATH:/usr/local/scala/bin


#==============================
# ADD HiBench to docker image
#==============================

# HiBench Version ( can be 3.0 or 4.0 )
ENV HIBENCH_VERSION 4.0

# download right version of HiBench
RUN cd /root
RUN wget https://github.com/intel-hadoop/HiBench/archive/v${HIBENCH_VERSION}-branch.zip
RUN unzip v${HIBENCH_VERSION}-branch.zip
RUN rm -f v${HIBENCH_VERSION}-branch.zip


