#!/bin/bash

# the following keys were auto-populated for you by Cloud CMS when you
# downloaded the developer's getting started kit
#
CLIENT_KEY=006ea10e-6f2c-4775-88df-f0baacfb628a
CLIENT_SECRET=71bfGqzGVV03FWVg2jxEiVIFtGhhoxyXKO9E8pBM0z0lSl1ApdkJGiys3pqaZyRNBUNoJZ1wkcyym0XCYUth0wVf5s/2cdO4iRjR55QP8O0=
USERNAME=06dee530-d3ee-4b19-b5c3-a7f85c124a11
PASSWORD=r9G3ds6/i/IqrDvM2vspb0iwH9vljQIp42WL94k1/HeRReImG6W88MhsxZlxut5zvv5jPLrsOeC8jGAc6kXLzt+SLTjaBywu1KB6uM/rcG8=
BASE_URL=http://localhost:8080
REPOSITORY_ID=6a7e1e14a48b312c89bc
BRANCH_ID=master

# connect via OAuth 2.0 and get an access token
ACCESS_TOKEN_REQUEST_RESPONSE=$(curl -X POST -u "$CLIENT_KEY:$CLIENT_SECRET" --data-urlencode "grant_type=password" --data-urlencode "username=$USERNAME" --data-urlencode "password=$PASSWORD" "$BASE_URL/oauth/token")
ACCESS_TOKEN=$(echo $ACCESS_TOKEN_REQUEST_RESPONSE | jq -r '.access_token')
