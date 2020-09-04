#!/bin/bash

source apiKeys.sh

curl -i "$CURL_HOSTNAME/login/partnerLogin" \
--key ~/Downloads/clover-cvs.key \
--cert ~/Downloads/clover.crt \
--header 'Content-Type: application/json' \
--data-raw '{
    "partnerLoginRequest": {
        "header": {
            "serviceContext": {
                "apiVersion": "1.0",
                "lineOfBusiness": "PBM",
                "channelName": "WEB",
                "responseFormat": "JSON",
                "appName": "CMK_WEB"
            },
            "securityContext": {
                "securityType": "apiKey",
                "apiKey": "'"$CURL_API_KEY"'"
            }
        },
        "details": {
            "member": {
                "firstName": "Will",
                "lastName": "Audis",
                "gender": "M",
                "dateOfBirth": "1987-02-02",
                "externalId": "SR185310101",
                "clientCode": "BLNK"
            },
            "partnerOptionalInfo": {
                "loggedInMemberProxyId": "101A"
            }
        }
    }
}'