#!/bin/bash

echo "Start building hibench-base image..."
sudo docker build -t hibench-base ./base

echo "Start building hibench-cdh image..."
sudo docker build -t hibench-docker ./cdh-docker

