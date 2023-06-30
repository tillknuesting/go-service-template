#!/bin/bash

kubectl port-forward service/key-value-service 8080:8080 &
sleep 1

response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: application/json" -d '{"key": "key1", "value": "value1"}' http://localhost:8080/set)

if [[ $response -eq 200 ]]; then
    echo "First request returned 202 OK"
else
    echo "First request returned $response instead of 202"
    exit 1
fi

sleep 1

value=$(curl -s -X POST -H "Content-Type: application/json" -d '{"key": "key1"}' http://localhost:8080/get | jq -r '.value')

if [[ $value == "value1" ]]; then
    echo "Second request returned the expected value 'value1'"
else
    echo "Second request returned '$value' instead of 'value1'"
    exit 1
fi
