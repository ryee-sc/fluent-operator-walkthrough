# minikube setup:
```
./create-minikube-cluster-for-mac.sh
```

# kafka setup:
```
./deploy-kafka-poc.sh
```

# fluent-operator setup:
```
./deploy-fluent-operator.sh
```

# fluent-http service:

deploy fluent services
```
kubectl apply -f fluentd-poc.yaml
```

get config
```
kubectl -n fluent get secrets fluentd-http-config -ojson | jq '.data."app.conf"' | awk -F '"' '{printf $2}' | base64 --decode
```

port forward fluentd-http:
```
kubectl -n fluent port-forward  fluentd-http-0   9880:9880
```

port forward kafka-ui:
```
kubectl -n kafka port-forward  kafka-ui-deployment-58f4bf5965-2s267 8080
```