# license Apache 2.0

This is the docker image for [intel-hibench](https://github.com/intel-hadoop/HiBench) implementation
We build a  pseudo cluster environment on Ubuntu14.04 and run applications on yarn-cluster

### Docker image

First, Build the docker image by executing:

```bash

    $./scripts/build-docker.sh
```


### Run HiBench workload

Then, run the wordcount workload by executing:

```bash

    $./scripts/run-example.sh

```

You are encouraged to test different workloads by modifying the configurations in
the script "scripts/run-example.sh"
**make sure that your configuration of HiBench should be coherent with the cdh-cluster, and you can modify it under the directory under the cdh image.**

```
    $sudo docker run -ti hibench-docker /bin/bash
```

When entering the container of the hibench-docker, you are normally guided to a root user, please modify configurations under the HiBench directory :
```
    #cd /root/HiBench-v${HiBench_VERSION}-branch
    #cd conf/
```

### References
- https://github.com/scivm/scientific-python-2.7
- https://github.com/dockerfile/java
- https://github.com/ezhaar/docker-hadoop
- https://github.com/ezhaar/docker-scala
- https://github.com/ezhaar/docker-spark
- https://github.com/sequenceiq/docker-hadoop-ubuntu
- https://github.com/chali/cdh5-pseudo-distributed-cluster-docker
