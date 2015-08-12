#!/bin/bash

CUR_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
HOME_DIR=${CUR_DIR}/..

CONFIG_FILE=${HOME_DIR}/hibench-docker.conf
DOCKERFILE_ADDR=${HOME_DIR}/base/Dockerfile
echo "# build environment on ubuntu14.04" > ${DOCKERFILE_ADDR}

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
      *)
        echo "ENV $line"  >> ${DOCKERFILE_ADDR}
        ;;
    esac
done < "$CONFIG_FILE"

cat ${HOME_DIR}/base/base-core >> ${DOCKERFILE_ADDR}
