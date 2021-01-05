#!/bin/bash

# Remove Kibana
KB_PREFIX=$(kubectl get kibana -o go-template='{{(index .items 0).metadata.name}}')
kubectl delete kibana ${KB_PREFIX}
kubectl delete -f ./manifest/kibana.yaml

# Remove APM Server
kubectl delete -f ./manifest/apm-server.yaml

# Remove Heartbeat
kubectl delete -f ./config/heartbeat-config.yaml
kubectl delete -f ./manifest/apm-heartbeat.yaml

# Remove Elasticsearch
kubectl delete -f ./manifest/elasticsearch.yaml