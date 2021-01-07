# Working with documents on Elasticsearch
For each API request will exists three examples:
- **Without** authentication and **without** SSL
- **With** authentication and **without** SSL
- **With** authentication and **with** SSL enabled


## Update document by condition
```bash
POST_DATA='
{
  "script": {
    "source": "if (ctx._source.in_stock == 0) { ctx.op = \"noop\"; } ctx._source.in_stock--;"
  }
}'
# Updating document with ID 100 using parameters
curl -XPOST -H "Content-Type: application/json" https://localhost:9200/products/_update/100 --data "${POST_DATA}"
curl -XPOST -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_update/100 --data "${POST_DATA}"
curl -XPOST -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_update/100 --data "${POST_DATA}"
```

