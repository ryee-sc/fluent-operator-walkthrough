#!/bin/bash
set -eu
# Simple script to deploy Kafka to a Kubernetes cluster with context already set
KAFKA_NAMESPACE=${KAFKA_NAMESPACE:-kafka}
CLUSTER_NAME=${CLUSTER_NAME:-fluent}

kubectl create namespace kafka
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
kubectl apply -f https://strimzi.io/examples/latest/kafka/kraft/kafka-single-node.yaml -n kafka 
kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka 

cat <<EOF | kubectl apply -f kafka-ui.yaml
