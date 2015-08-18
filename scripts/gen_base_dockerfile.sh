#!/bin/bash

CUR_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
HOME_DIR=${CUR_DIR}/..

CONFIG_FILE=${HOME_DIR}/hibench-docker.conf
DOCKERFILE_ADDR=${HOME_DIR}/base/Dockerfile
CLOUDERAFILE_ADDR=${HOME_DIR}/cdh-docker/conf/cloudera.list
echo "# build environment on ubuntu14.04" > ${DOCKERFILE_ADDR}
echo "# Packages for Cloudera's Distribution for Hadoop, Spark" > ${CLOUDERAFILE_ADDR}

OS_DETAIL="FROM "
while IFS='' read -r line || [[ -n "$line" ]]; do
    case $line in 
      \#*)
        echo "$line" >> ${DOCKERFILE_ADDR}
        ;;
      "")
        echo "$line" >> ${DOCKERFILE_ADDR}
        ;;
      OS_DIST*)
        OS_DIST=`echo $line | cut -d ' ' -f 2`
        OS_DETAIL=${OS_DETAIL}${OS_DIST}
        ;;
      OS_VERSION*)
        OS_VERSION=`echo $line | cut -d ' ' -f 2`
        OS_DETAIL=${OS_DETAIL}:${OS_VERSION}
        echo ${OS_DETAIL} >> ${DOCKERFILE_ADDR}
        ;;
      CDH_VERSION_DETAIL*)
        CDH_VERSION_DETAIL=`echo $line | cut -d ' ' -f 2`
        CDH_VERSION=`echo $CDH_VERSION_DETAIL | cut -d '.' -f 1`
        echo "deb [arch=amd64] http://archive.cloudera.com/cdh${CDH_VERSION}/ubuntu/trusty/amd64/cdh trusty-cdh${CDH_VERSION_DETAIL} contrib" >> ${CLOUDERAFILE_ADDR}
        echo "deb-src http://archive.cloudera.com/cdh${CDH_VERSION}/ubuntu/trusty/amd64/cdh trusty-cdh${CDH_VERSION_DETAIL} contrib" >> ${CLOUDERAFILE_ADDR}
        ;;
      *)
        echo "ENV $line"  >> ${DOCKERFILE_ADDR}
        ;;
    esac
done < "$CONFIG_FILE"

cat ${HOME_DIR}/base/base-core >> ${DOCKERFILE_ADDR}
