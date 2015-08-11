# license Apache 2.0

This is the docker image for [intel-hibench](https://github.com/intel-hadoop/HiBench) implementation.
We build a  pseudo single-node environment on Ubuntu14.04.


### Run Container with HiBench and all dependencies installed

Then, launch the container by executing:

```bash
    $./scripts/run-container.sh
```

When entering the container of the hibench-docker, you are normally guided to a root user, please modify configurations under the HiBench directory :
```bash
    #cd /root/HiBench-v${HiBench_VERSION}-branch
```

### References
- https://github.com/scivm/scientific-python-2.7
- https://github.com/dockerfile/java
- https://github.com/ezhaar/docker-hadoop
- https://github.com/ezhaar/docker-scala
- https://github.com/ezhaar/docker-spark
- https://github.com/sequenceiq/docker-hadoop-ubuntu
- https://github.com/chali/cdh5-pseudo-distributed-cluster-docker
- https://www.digitalocean.com/community/tutorials/how-to-install-hadoop-on-ubuntu-13-10
- http://serverfault.com/questions/666149/docker-copy-issue-no-such-file-or-directory
