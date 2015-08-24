
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


This is the docker image for [intel-hibench](https://github.com/intel-hadoop/HiBench) implementation.
We build a  pseudo single-node environment on Ubuntu14.04.


### Build and Run Container with HiBench and all dependencies installed

Launch the container by executing:

```bash
    $./scripts/run-container.sh cdh
```
OR
```bash
    $./scripts/run-container.sh open-source
```

When entering the container of the hibench-docker, you are normally guided to a root user, please modify configurations under the HiBench directory :
```bash
    #cd ${HIBENCH_HOME}
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
