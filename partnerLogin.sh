#!/bin/bash

source apiKeys.sh

curl -i -vvv "$LOGIN_HOSTNAME/login/partnerLogin" $CURL_CERT_OPTIONS \
--header 'Content-Type: application/json' \
--data-raw '{
    "partnerLoginRequest": {
        "header": {
            "serviceContext": {
                "appName": "SDK_CLOVER",
                "channelName": "WEB",
                "lineOfBusiness": "PBM",
                "deviceID": "device12345",
                "deviceToken": "device12345",
                "deviceType": "DESKTOP",
                "apiVersion": "5.0",
                "responseFormat": "JSON"
            },
            "securityContext": {
                "apiKey": "'$LOGIN_API_KEY'",
                "securityType": "apikey"
            }
        },
        "details": {
            "member": {
                "firstName": "RAG",
                "lastName": "NAIR",    
                "gender": "M",
                "dateOfBirth": "1981-05-02",
                "externalId": "835T91771",
                "clientCode": "BLNK"                
            }
        }
    }
}'