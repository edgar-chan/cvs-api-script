#!/bin/bash

TEST_HOSTNAME="https://sit2sdkservices-2wayssl.caremark.com"
# TEST_HOSTNAME="http://localhost:32768"
TEST_API_KEY="$TEST_API_KEY"

PROD_HOSTNAME="https://sdkservices-2wayssl.caremark.com"
PROD_API_KEY="$PROD_API_KEY"

CURL_HOSTNAME=
CURL_API_KEY=


if [[ $ENV == "PROD" ]]; then
    CURL_HOSTNAME="$PROD_HOSTNAME"
    CURL_API_KEY="$PROD_API_KEY"
else
    CURL_HOSTNAME="$TEST_HOSTNAME"
    CURL_API_KEY="$TEST_API_KEY"
fi

if ! [ -z $MOCK ]; then
    echo MOCK: $MOCK
    CURL_HOSTNAME="$CURL_HOSTNAME/mock"
fi

echo "CURL_HOSTNAME: $CURL_HOSTNAME"
echo "CURL_API_KEY: $CURL_API_KEY"