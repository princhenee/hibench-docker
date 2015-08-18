#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "#=================================================#"
echo "     This script first build the images            "
echo "       and then launch the container               "
echo "         with all dependencies installed           "
echo "#=================================================#"

${DIR}/build-docker.sh $1
if [ $? == 1 ]; then
    exit 1;
fi
#WL_NAME=wordcount
# run HiBench workload example
# Format: sudo docker run (-v "LocalLargeDiskDir:/usr/loal"-it) hibench-hadoop-spark /bin/bash /root/HiBench/workloads/<workload-name>/prepare/prepare.sh
sudo docker run -ti hibench-docker
