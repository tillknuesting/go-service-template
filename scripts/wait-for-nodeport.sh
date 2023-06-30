#!/bin/bash


retries=0
until kubectl get service key-value-service -n default -o jsonpath='{.spec.ports[0].nodePort}' | grep -v "<none>"; do
  if [ $retries -eq 30 ]; then
    echo "Microservice service does not have a NodePort assigned after multiple retries."
    exit 1
  fi
  retries=$((retries+5))
  sleep 5
done
echo "Microservice service has a NodePort assigned."

