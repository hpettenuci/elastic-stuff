# Managing Elasticsearch Index
For each API request will exists three examples:
- **Without** authentication and **without** SSL
- **With** authentication and **without** SSL
- **With** authentication and **with** SSL enabled

## Create new index
```bash
# Create index named pages
curl -XPUT http://localhost:9200/pages
curl -XPUT -u username:password http://localhost:9200/pages
curl -XPUT -u username:password -k https://localhost:9200/pages
```

## Delete index
```bash
# Delete index named pages
curl -XDELETE http://localhost:9200/pages
curl -XDELETE -u username:password http://localhost:9200/pages
curl -XDELETE -u username:password -k https://localhost:9200/pages
```

## Create index with settings
```bash
# Create index named pages with settings
curl -XPUT -H "Content-Type: application/json" https://localhost:9200/pages -d '{ "settings": { "number_of_shards": 2, "number_of_replicas": 2 } }'
curl -XPUT -H "Content-Type: application/json" -u username:password http://localhost:9200/pages -d '{ "settings": { "number_of_shards": 2, "number_of_replicas": 2 } }'
curl -XPUT -H "Content-Type: application/json" -u username:password -k https://localhost:9200/pages -d '{ "settings": { "number_of_shards": 2, "number_of_replicas": 2 } }'
```