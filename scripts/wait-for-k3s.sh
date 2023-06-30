#!/bin/bash

retries=0
until sudo systemctl is-active --quiet k3s; do
  if [ $retries -eq 30 ]; then
    echo "k3s service is not running after multiple retries."
    exit 1
  fi
  retries=$((retries+1))
  sleep 5
done
echo "k3s service is running."
