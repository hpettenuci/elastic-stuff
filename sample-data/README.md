# Importing data
Here is available a bunch of data to import in your Elasticsearch environment. It will be useful to execute some query examples.

```bash
# Environment without authentication and without SSL
curl -H "Content-Type: application/x-ndjson" -XPOST http://localhost:9200/products/_bulk --data-binary "@products.json"
curl -H "Content-Type: application/x-ndjson" -XPOST http://localhost:9200/orders/_bulk --data-binary "@orders.json"
curl -H "Content-Type: application/x-ndjson" -XPOST http://localhost:9200/recipes/_bulk --data-binary "@recipes.json"

# Environment with authentication and without SSL
curl -H "Content-Type: application/x-ndjson" -XPOST -u username:password http://localhost:9200/products/_bulk --data-binary "@products.json"
curl -H "Content-Type: application/x-ndjson" -XPOST -u username:password http://localhost:9200/orders/_bulk --data-binary "@orders.json"
curl -H "Content-Type: application/x-ndjson" -XPOST -u username:password http://localhost:9200/recipes/_bulk --data-binary "@recipes.json"

# Environment with authentication and with SSL enabled
# cUrl return a error for self signed certificates, for this reason it's necessary to include -k parameter
curl -k -H "Content-Type: application/x-ndjson" -XPOST -u username:password https://localhost:9200/products/_bulk --data-binary "@products.json"
curl -k -H "Content-Type: application/x-ndjson" -XPOST -u username:password https://localhost:9200/orders/_bulk --data-binary "@orders.json"
curl -k -H "Content-Type: application/x-ndjson" -XPOST -u username:password https://localhost:9200/recipes/_bulk --data-binary "@recipes.json"
```