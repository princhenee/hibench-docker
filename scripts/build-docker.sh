#!/bin/bash

CUR_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
HOME_DIR=${CUR_DIR}/..


function build-base() {
echo "============================================"
echo "   Start building hibench-base image...     "
echo "============================================"
bash ${CUR_DIR}/gen_base_dockerfile.sh
sudo docker build -t hibench-base ${HOME_DIR}/base/
}

function second-step() {
echo "============================================"
echo "   Start building hibench-docker image...   "
echo "============================================"
}

case "$1" in
  "cdh")
     build-base
     second-step
     sudo docker build -t hibench-docker ${HOME_DIR}/cdh-docker/
     ;;
  "standalone")
     build-base
     second-step
     sudo docker build -t hibench-docker ${HOME_DIR}/hadoop-spark/
     ;;
  *)
     echo "Usage $0 {cdh|standalone}"
     exit 1
     ;;
esac

