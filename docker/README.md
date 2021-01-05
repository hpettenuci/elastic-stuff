# Elastic Stack on Docker
This environment deploy an Elastic Stack solution using self generated certificates and deploy a single node Elasticsearch, Kibana, APM Server, Metricbeat and Heartbeat.

## Enviroment Variables File
On **.env** file it's possible to configure some parameters to run the solution
- **VOLUME_DATA_PATH**: Local path that all data volume will store all data.
- **ELASTIC_VERSION**: Elastic Stack version that will be deployed.
- **ELASTIC_PASSWORD**: Default password for elastic user.
- **XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY**: Hash used by Kibana encryption configuration.

## Generating Certificates
Before running the entire solution you need to generate the certificates. First, you need to edit **instances.yml**. It's very important put on this file all instances will receive connections.

```yaml
instances:
  - name: elasticsearch-1
    dns:
      - elasticsearch-1
      - localhost
    ip:
      - 127.0.0.1

  - name: 'kibana'
    dns: 
      - kibana
      - localhost

```

After configure instances.yml start a container that will generate all certificates and a commun CA.

```bash
docker-compose -f create-certs.yml up -d
```

## Deploy Elastic Stack
Now we already have all pre-requirements to deploy Elastic Stack in a local environment. To deploy all the stack use following command:

```bash
docker-compose up -d
```