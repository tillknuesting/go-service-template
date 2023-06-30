#!/bin/bash

sleep 10
retries=0
until kubectl get nodes -o jsonpath='{.items[0].status.conditions[?(@.type=="Ready")].status}' | grep True; do
  if [ $retries -eq 30 ]; then
    echo "Node is not ready after multiple retries."
    exit 1
  fi
  retries=$((retries+10))
  sleep 10
done
echo "Node is ready."
