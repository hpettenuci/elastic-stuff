#!/bin/bash

# When use in a local environment like minikube, set to yes
USE_LOCALHOST="Y"

# Choose what applications will be executed
START_ELASTICSEARCH="Y"
START_KIBANA="Y"
START_APM="Y"
START_HEARTBEAT="Y"

###################################################################################################################
### ELASTICSEARCH
###################################################################################################################
if [ "${START_ELASTICSEARCH}" == "Y" ]; then
    # Deploy Elasticsearch
    kubectl apply -f ./manifest/elasticsearch.yaml

    # Get Cluster Prefix 
    ES_PREFIX=$(kubectl get elasticsearch -o go-template='{{(index .items 0).metadata.name}}')

    # Get ClusterIP info
    ES_CLUSTER_IP=$(kubectl get service ${ES_PREFIX}-es-http -o go-template='{{.spec.clusterIP}}')

    # Get generated password from secrets
    PASSWORD=$(kubectl get secret ${ES_PREFIX}-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')

    if [ "${USE_LOCALHOST}" == "Y "]; then
        # Creating local service redirect
        kubectl port-forward service/${ES_PREFIX}-es-http 9200 &        
        
        ES_CLUSTER_IP="localhost"
    fi
    # Check Elasticsearch Status
    curl -u "elastic:$PASSWORD" -k "https://${ES_CLUSTER_IP}:9200"
fi
###################################################################################################################
### KIBANA
###################################################################################################################
if [ "${START_KIBANA}" == "Y" ]; then
    # Generate EncryptionKey
    HASH_KEY=$(openssl rand -hex 32)
    kubectl create secret generic kibana-secret-settings --from-literal=xpack.security.encryptionKey=${HASH_KEY}

    # Deploy Kibana
    kubectl apply -f ./manifest/kibana.yaml
    # Get Cluster Prefix 
    KB_PREFIX=$(kubectl get kibana -o go-template='{{(index .items 0).metadata.name}}')

    # Get ClusterIP info
    KB_CLUSTER_IP=$(kubectl get service ${KB_PREFIX}-kb-http -o go-template='{{.spec.externalIp}}')

    if [ "${USE_LOCALHOST}" == "Y "]; then
        # Creating local service redirect
        kubectl port-forward service/${KB_PREFIX}-kb-http 5601 &
        KB_CLUSTER_IP="localhost"
    fi

    echo "Kibana URL: https://${KB_CLUSTER_IP}:5601 "

    # Get elastic users password
    echo "Elastic password to connect on Kibana: "
    ES_PREFIX=$(kubectl get elasticsearch -o go-template='{{(index .items 0).metadata.name}}')
    kubectl get secret ${ES_PREFIX}-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
fi
###################################################################################################################
### APM SERVER
###################################################################################################################
if [ "${START_APM}" == "Y" ]; then
    # Deploy APM Server
    kubectl apply -f ./manifest/apm-server.yaml
    # Get Cluster Prefix 
    APM_PREFIX=$(kubectl get apmservers -o go-template='{{(index .items 0).metadata.name}}')

    # Get ClusterIP info
    APM_CLUSTER_IP=$(kubectl get service ${APM_PREFIX}-kb-http -o go-template='{{.spec.externalIp}}')

        if [ "${USE_LOCALHOST}" == "Y "]; then
        # Creating local service redirect
        kubectl port-forward service/${APM_PREFIX}-apm-http 5601 &
        KB_CLUSTER_IP="localhost"
    fi

    # Get APM Token to connect
    APM_TOKEN=$(kubectl get secret/${APM_PREFIX}-apm-token -o go-template='{{index .data "secret-token" | base64decode}}')
    echo "APM Token: ${APM_TOKEN}"
fi
###################################################################################################################
### HEARTBEAT
###################################################################################################################
if [ "${START_HEARTBEAT}" == "Y" ]; then
    # Create Config Secret
    kubectl apply -f ./config/heartbeat-config.yaml

    # Deploy Heartbeat
    kubectl apply -f ./manifest/heartbeat.yaml
    
fi