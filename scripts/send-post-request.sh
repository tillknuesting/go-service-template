#!/bin/bash

kubectl get deployments -A
curl -X POST -H "Content-Type: application/json" -d '{"key": "key1", "value": "value1"}' http://localhost:8080/set

