#!/bin/bash

set -e

# Replace with real URL
SVC_URL="172.20.204.114"

kubectl apply -f index_green_html.yml
kubectl apply -f green.yml

sleep 10

RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" "SVC_URL")

if [ "$HTRESPONSE_CODE" -eq 200 ]; then
  echo "Green deployment is OK"
else
  echo "Green deployment is not OK"
  exit 1
fi