#!/bin/bash

source apiKeys.sh

curl -i -vv "$AGP_HOSTNAME/AGP/api/client/claim/getclaimdetail" \
--header 'Content-Type: application/json' \
--data-raw '{
  "getClaimsHistoryRequest": {
    "header": {
        "serviceContext": {
        "apiVersion": "1.0",
        "lineOfBusiness": "",
        "appName": " SDK_CLOVER",
        "channelName": "Web",
        "responseFormat": "JSON",
        "requesterId": "DIGITAL_SPECIALTY",
        "refID": "'$REF_ID'",
        "tokenID": "'$TOKEN_ID'",
        "clientName": ""
      },
      "securityContext": {
        "securityType": "apiKey",
        "apiKey": "'$APG_API_KEY'"
      }
    },
    "details": {
      "claimNumber" : "202104641030005",
      "claimSeqNumber" : "999"
    }
  }
}'