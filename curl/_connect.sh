#!/bin/bash

# these should contain your Cloud CMS API Keys
# BASE_URL generally defaults to: https://api.cloudcms.com
#
CLIENT_KEY={{{clientKey}}}
CLIENT_SECRET={{{clientSecret}}}
USERNAME={{{username}}}
PASSWORD={{{password}}}
BASE_URL={{{baseURL}}}
REPOSITORY_ID={{{repositoryId}}}
BRANCH_ID={{{branchId}}}

# tango mango node
NODE_ID={{{nodeId}}}

# connect via OAuth 2.0 and get an access token
ACCESS_TOKEN_REQUEST_RESPONSE=$(curl -X POST -u "$CLIENT_KEY:$CLIENT_SECRET" --data-urlencode "grant_type=password" --data-urlencode "username=$USERNAME" --data-urlencode "password=$PASSWORD" "$BASE_URL/oauth/token")
ACCESS_TOKEN=$(echo $ACCESS_TOKEN_REQUEST_RESPONSE | jq -r '.access_token')
