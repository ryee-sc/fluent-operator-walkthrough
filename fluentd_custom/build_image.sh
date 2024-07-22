#!/bin/bash

# eval $(minikube docker-env)

docker build -t fluentd-custom:latest .

docker tag fluentd-custom:latest localhost:5000/fluentd-custom:latest
docker push localhost:5000/fluentd-custom:latest

# minikube image load fluentd-custom:latest