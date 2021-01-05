# Elastic Snapshot

# Requirements

Before start the snapshot process it is necessary to configure the AWS IAM describe in this [documentation](https://www.elastic.co/guide/en/cloud/current/ec-migrate-from-aws.html)

To execute que elastic-aws-snapshot, please install Python libraries using the following command:

```bash
pip3 install --user -r ./requirements.txt
```

Besides Python requirements it is  necessary to install the AWS S3 plugin on ElasticSearch. For more details please check the official [documentation](https://www.elastic.co/guide/en/elasticsearch/plugins/6.3/repository-s3.html):

```bash
elasticsearch-plugin install repository-s3
```

After install the AWS S3 Plugin will be required a Elasticsearch restart.

# Options

**STATUS** - Displays the status of a running snapshot.

**INDEX** - Lists the indices and their statistics.

**REGISTER** - Register an S3 repository to store the Snapshot.

**RESTORE** - Starts a snapshot restore.

**SNAPSHOT** - Starts the snapshot routine.