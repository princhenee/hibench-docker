#!/bin/bash

# run HiBench workload example
# Format: sudo docker run -it hibench-docker /bin/bash /root/HiBench/workloads/<workload-name>/prepare/prepare.sh
sudo docker run -it hibench-docker /bin/bash /root/HiBench/workloads/wordcount/prepare/prepare.sh
