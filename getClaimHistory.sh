#!/bin/bash

source apiKeys.sh

curl -i "$AGP_HOSTNAME/AGP/api/client/claim/getclaimshistory" \
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
      "startDate": "2020-03-01",
      "endDate": "2020-09-24",
      "nonActionableRefillsOnly": false,
      "members": []
    }
  }
}
'