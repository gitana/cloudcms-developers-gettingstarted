#!/bin/bash

#
# Creates a single product with an image attachment using 2 separate calls.
#

# connect to Cloud CMS and get an OAuth 2.0 access token
source ./connect.sh

# the things we'll upload
NODE_JSON_PATH=../assets/cupcake.json
NODE_ATTACHMENT_PATH=../assets/cupcake.jpg

# create the node
CREATE_NODE_RESPONSE=$(curl --request POST --data "@$NODE_JSON_PATH" -H "Content-Type: application/json" -H "Authorization: bearer $ACCESS_TOKEN" "$BASE_URL/repositories/$REPOSITORY_ID/branches/$BRANCH_ID/nodes")
echo Create Node Response: $CREATE_NODE_RESPONSE
CREATED_NODE_ID=$(echo $CREATE_NODE_RESPONSE | jq -r '._doc')
echo Created Node ID: $CREATED_NODE_ID

# upload binary file as default attachment of the newly created node
UPLOAD_ATTACHMENT_RESPONSE=$(curl --request POST --data-binary "@$NODE_ATTACHMENT_PATH" -H "Content-Type: image/jpeg" -H "Authorization: bearer $ACCESS_TOKEN" "$BASE_URL/repositories/$REPOSITORY_ID/branches/$BRANCH_ID/nodes/$CREATED_NODE_ID/attachments/default")
echo Upload Attachment Response: $UPLOAD_ATTACHMENT_RESPONSE
