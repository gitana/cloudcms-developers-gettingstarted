#!/bin/bash

#
# Downloads a single product's "default" attachment.
#

# connect to Cloud CMS and get an OAuth 2.0 access token
source ./connect.sh

# tango mango node
NODE_ID=ea8e52d8f2f65d9fcefd

# make the API call passing the access token over
curl --output "tango-mango.jpg" -X GET -H "Content-Type: application/json" -H "Authorization: bearer $ACCESS_TOKEN" "$BASE_URL/repositories/$REPOSITORY_ID/branches/$BRANCH_ID/nodes/$NODE_ID/attachments/default"
