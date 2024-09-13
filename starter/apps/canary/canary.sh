#!/bin/bash

set -e

# Replace with real URL
CANARY_SVC_URL="172.20.204.114"

kubectl apply -f canary-v2.yml

sleep 10

RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$CANARY_SVC_URL")

if [ "$HTRESPONSE_CODE" -eq 200 ]; then
  echo "Canary deployment is OK"
else
  echo "Canary deployment is not OK"
  exit 1
fi