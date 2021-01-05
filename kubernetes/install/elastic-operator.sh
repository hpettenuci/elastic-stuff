#!/bin/bash

# Please check current available version in https://www.elastic.co/guide/en/cloud-on-k8s/master/eck-release-notes.html
OPERATOR_VERSION="1.3.1"
YAML_FILE_NAME="elastic.yaml"

# Download and configure Elastic Operator
curl -s https://download.elastic.co/downloads/eck/${OPERATOR_VERSION}/all-in-one.yaml -o $YAML_FILE_NAME
kubectl apply -f $YAML_FILE_NAME

# Clean used files
rm -f $YAML_FILE_NAME