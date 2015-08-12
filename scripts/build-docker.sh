#!/bin/bash

CUR_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
HOME_DIR=${CUR_DIR}/..


echo "============================================"
echo "   Start building hibench-base image...     "
echo "============================================"
bash ${CUR_DIR}/gen_base_dockerfile.sh
sudo docker build -t hibench-base ${HOME_DIR}/base/


echo "============================================"
echo "   Start building hibench-docker image...   "
echo "============================================"
sudo docker build -t hibench-docker ${HOME_DIR}/hadoop-spark/

