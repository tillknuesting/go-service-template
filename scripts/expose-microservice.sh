#!/bin/bash

kubectl expose deployment key-value-service --port=8080 --target-port=8080 --type=NodePort -n default
