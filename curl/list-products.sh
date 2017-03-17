#!/bin/bash

# Calls over to the Cloud CMS sample project and retrieves 5 products.

# connect to Cloud CMS and get an OAuth 2.0 access token
source ./connect.sh

# make the API call passing the access token over
QUERY="{'_type': 'catalog:product'}"
RESULT=$(curl -v -X POST --data "$QUERY" -H "Content-Type: application/json" -H "Authorization: bearer $ACCESS_TOKEN" "$BASE_URL/repositories/$REPOSITORY_ID/branches/$BRANCH_ID/nodes/query?full=true&metadata=true&limit=5")
echo $RESULT
echo

