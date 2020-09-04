#!/bin/bash

source apiKeys.sh

curl -i "$CURL_HOSTNAME/AGP/api/client/claim/getclaimdetail" \
--key ~/Downloads/clover-cvs.key \
--cert ~/Downloads/clover.crt \
--header 'Content-Type: application/json' \
--data-raw '{
  "getClaimsHistoryRequest": {
    "header": {
      "serviceContext": {
        "apiVersion": "1.0",
        "lineOfBusiness": "PBM",
        "appName": "CMK_WEB",
        "channelName": "Web",
        "responseFormat": "JSON",
        "requesterId": "DIGITAL_SPECIALTY",
        "tokenID": "single-plan-with-family",
        "clientName": ""
      },
      "securityContext": {
        "securityType": "apiKey",
        "apiKey": "'"$CURL_API_KEY"'"
      }
    },
    "details": {
      "startDate": "",
      "endDate": "",
      "nonActionableRefillsOnly": false
    }
  }
}'