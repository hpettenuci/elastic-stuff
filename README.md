![CodeQL](https://github.com/hpettenuci/elastic-stuff/workflows/CodeQL/badge.svg?branch=main)  [![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-blue.svg)](https://conventionalcommits.org)

# Elastic Repository
I love to spend some time working and researching tools provided by [Elastic.co](http://elastic.co)! For this reason I started to organize this repository with my scripts and  implementations of Elastic Solutions.

## Environments
I have been working with Elastic in different kind of environments but the containerized environments are easier to create labs and control production environment too. Here you can see two kind of evironments:
- **Docker**:  using a docker-compose and env variables to create a environment with a single node of ElasticSearch, Kibana, APM Server and some Beats. It's useful to local develop.
- **Kubernetes**: ECK (Elastic Cloud on Kubernetes) provide a Kubenetes Operator that allows you deploy an environment scalable. Here it's configured a environment with ElasticSearch using hostpath to persistent storage, Kibana, APM Server and some Beats. This environment will be useful when you already have a Kubernets Cluster available or already use minikube or Kubernets on Docker Desktop in your Workflow

## Tools
Elastic solutions have a lot of features and sometimes you need some tools will help to do something. In this session you will find some simple tools developed to help in specific tasks.

## Elasticsearch API commands and Sample Data
- sample-data folder contains a collection that will be usefull to exeute query examples.
- elasticsearch-api contains some commands to interact with ElasticSearch data.

These content has created during the course [Complete Guide to Elasticsearch course](https://l.codingexplained.com/r/elasticsearch-course?src=github).