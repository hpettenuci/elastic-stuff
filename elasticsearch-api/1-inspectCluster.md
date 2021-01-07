# Inspecting Elasticsearch Cluster
For each API request will exists three examples:
- **Without** authentication and **without** SSL
- **With** authentication and **without** SSL
- **With** authentication and **with** SSL enabled

## Check cluster's health
```bash
curl -XGET http://localhost:9200/_cluster/health
curl -XGET -u username:password http://localhost:9200/_cluster/health
curl -XGET -u username:password -k https://localhost:9200/_cluster/health
```

## List cluster's nodes
```bash
curl -XGET http://localhost:9200/_cat/nodes?v
curl -XGET -u username:password http://localhost:9200/_cat/nodes?v
curl -XGET -u username:password -k https://localhost:9200/_cat/nodes?v
```

## List cluster's indices
```bash
curl -XGET http://localhost:9200/_cat/indices?v
curl -XGET -u username:password http://localhost:9200/_cat/indices?v
curl -XGET -u username:password -k https://localhost:9200/_cat/indices?v
```

## Check shard distribution
```bash
curl -XGET http://localhost:9200/_cat/shards?v
curl -XGET -u username:password http://localhost:9200/_cat/shards?v
curl -XGET -u username:password -k https://localhost:9200/_cat/shards?v
```