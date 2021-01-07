# Working with documents on Elasticsearch
For each API request will exists three examples:
- **Without** authentication and **without** SSL
- **With** authentication and **without** SSL
- **With** authentication and **with** SSL enabled


# Inserting Documents
## Index document using auto generated ID:
```bash
# Insert document on products index
curl -XPOST -H "Content-Type: application/json" https://localhost:9200/products/_doc -d '{ "name": "Coffee Maker", "price": 64, "in_stock": 10 }'
curl -XPOST -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_doc -d '{ "name": "Coffee Maker", "price": 64, "in_stock": 10 }'
curl -XPOST -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_doc -d '{ "name": "Coffee Maker", "price": 64, "in_stock": 10 }'
```

## Index document using auto generated ID:
```bash
# Insert document on products index
curl -XPOST -H "Content-Type: application/json" https://localhost:9200/products/_doc/2000 -d '{ "name": "Toaster", "price": 49, "in_stock": 4 }'
curl -XPOST -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_doc/2000 -d '{ "name": "Toaster", "price": 49, "in_stock": 4 }'
curl -XPOST -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_doc/2000 -d '{ "name": "Toaster", "price": 49, "in_stock": 4 }'
```

# Getting documents
## Get document by ID
```bash
# Getting document with ID 100
curl -XGET  https://localhost:9200/products/_doc/100
curl -XGET  -u username:password http://localhost:9200/products/_doc/100
curl -XGET  -u username:password -k https://localhost:9200/products/_doc/100
```

## Get documents by query
```bash
# Get documents using query
# In this case using macth_all filter
curl -XGET -H "Content-Type: application/json" https://localhost:9200/products/_search -d '{ "query": { "match_all": {} } }'
curl -XGET -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_search -d '{ "query": { "match_all": {} } }'
curl -XGET -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_search -d '{ "query": { "match_all": {} } }'
```

# Updating documents
## Update document by ID
```bash
# Updating document with ID 100
curl -XPOST -H "Content-Type: application/json" https://localhost:9200/products/_update/100 -d '{ "doc": { "in_stock": 3 } }'
curl -XPOST -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_update/100 -d '{ "doc": { "in_stock": 3 } }'
curl -XPOST -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_update/100 -d '{ "doc": { "in_stock": 3 } }'
```

## Update documents by query
```bash
# Updating documents using query
# In this case using macth_all filter
curl -XPOST -H "Content-Type: application/json" https://localhost:9200/products/_update_by_query -d '{ "script": { "source": "ctx._source.in_stock++" }, "query": { "match_all": {} } }'
curl -XPOST -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_update_by_query -d '{ "script": { "source": "ctx._source.in_stock++" }, "query": { "match_all": {} } }'
curl -XPOST -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_update_by_query -d '{ "script": { "source": "ctx._source.in_stock++" }, "query": { "match_all": {} } }'
```
You can ignore update conflicts adding `?conflicts=proceed` in request URL or adding on request JSON.
```json
{
  "conflicts": "proceed",
  "script": {
    "source": "ctx._source.in_stock++"
  },
  "query": {
    "match_all": {}
  }
```

## Update documents with parameters
```bash
# Updating document with ID 100 using parameters
curl -XPOST -H "Content-Type: application/json" https://localhost:9200/products/_update/100 -d '{ "script": { "source": "ctx._source.in_stock -= params.quantity", "params": { "quantity": 4 } } }'
curl -XPOST -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_update/100 -d '{ "script": { "source": "ctx._source.in_stock -= params.quantity", "params": { "quantity": 4 } } }'
curl -XPOST -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_update/100 -d '{ "script": { "source": "ctx._source.in_stock -= params.quantity", "params": { "quantity": 4 } } }'
```

## Upsert document
```bash
# If document exists the information will be updated.
# If NOT exists will insert a new document
curl -XPOST -H "Content-Type: application/json" https://localhost:9200/products/_update/101 -d '{ "script": { "source": "ctx._source.in_stock++" }, "upsert": { "name": "Blender", "price": 399, "in_stock": 5 } }'
curl -XPOST -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_update/101 -d '{ "script": { "source": "ctx._source.in_stock++" }, "upsert": { "name": "Blender", "price": 399, "in_stock": 5 } }'
curl -XPOST -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_update/101 -d '{ "script": { "source": "ctx._source.in_stock++" }, "upsert": { "name": "Blender", "price": 399, "in_stock": 5 } }'
```

## Update document by ID
To control concurrency it's possible to use `?if_primary_term=X&if_seq_no=X` parameters on request. The document will be updated just if skill have the same primary_term and seq_no of the request.
```bash
# Updating document with ID 100
curl -XPOST -H "Content-Type: application/json" https://localhost:9200/products/_update/100?if_primary_term=X&if_seq_no=X -d '{ "doc": { "in_stock": 123 } }'
curl -XPOST -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_update/100?if_primary_term=X&if_seq_no=X -d '{ "doc": { "in_stock": 123 } }'
curl -XPOST -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_update/100?if_primary_term=X&if_seq_no=X -d '{ "doc": { "in_stock": 123 } }'
```

# Deleting  documents
## Delete document by ID
```bash
# Deleting document with ID 101
curl -XDELETE  https://localhost:9200/products/_doc/101
curl -XDELETE  -u username:password http://localhost:9200/products/_doc/101
curl -XDELETE  -u username:password -k https://localhost:9200/products/_doc/101
```

## Delete documents by query
As we see on updade, add `?conflicts=proceed` to resolve conflicts.
```bash
# Deleting documents using query
# In this case using macth_all filter
curl -XDELETE -H "Content-Type: application/json" https://localhost:9200/products/_update_by_query -d '{ "query": { "match_all": {} } }'
curl -XDELETE -H "Content-Type: application/json" -u username:password http://localhost:9200/products/_update_by_query -d '{ "query": { "match_all": {} } }'
curl -XDELETE -H "Content-Type: application/json" -u username:password -k https://localhost:9200/products/_update_by_query -d '{ "query": { "match_all": {} } }'
```