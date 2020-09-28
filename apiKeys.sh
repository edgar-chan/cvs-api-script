#!/bin/bash

if [[ $ENV == "PROD" ]]; then
    source .env.prod
    CURL_CERT_OPTIONS=" --key $SSL_KEY_FILE --cert $SSL_CER_FILE"
elif [[ $ENV == "TEST" ]]; then
    source .env.test
    CURL_CERT_OPTIONS=" --key $SSL_KEY_FILE --cert $SSL_CER_FILE"
else
    # local
    source .env.test
    # export LOGIN_HOSTNAME="http://partner-cvs-nonprod.cloverhealth.com:8090"
    export LOGIN_HOSTNAME="https://localhost:8090"
    # export AGP_HOSTNAME="http://partner-cvs-nonprod.cloverhealth.com:8090"
    export AGP_HOSTNAME="https://localhost:8090"
    # CURL_CERT_OPTIONS=""
    CURL_CERT_OPTIONS=" --key /usr/local/etc/nginx/certs/server-rsa.key --cert /usr/local/etc/nginx/certs/partner-cvs-nonprod_cloverhealth_com.crt -k "
fi

if ! [ -z $MOCK ]; then
    echo MOCK: $MOCK
    LOGIN_HOSTNAME="$LOGIN_HOSTNAME/mock"
    AGP_HOSTNAME="$AGP_HOSTNAME/mock"
fi

echo "--------------------------------"
echo "ENVIRONMENT: $ENV"
echo "--------------------------------"
echo "LOGIN_HOSTNAME: $LOGIN_HOSTNAME"
echo "LOGIN_API_KEY: $LOGIN_API_KEY"
echo "AGP_HOSTNAME: $AGP_HOSTNAME"
echo "AGP_API_KEY: $AGP_API_KEY"

# token will be expired after 30 minutes
TOKEN_ID="14a0d6da88bf45359b10d12c6ad53f75eff73917accb4a46867aaa4da46793c9"
REF_ID="bb0669db89d1493aa4edadb2cf9e3cf0"