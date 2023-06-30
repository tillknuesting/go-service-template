#!/bin/bash

cd ..

# Set execute permissions for scripts
chmod +x ./scripts/*.sh

# Wait for k3s node to be ready
./scripts/wait-for-node.sh

# Deploy Microservice
./scripts/deploy-microservice.sh

# Run test that verifies the behavior of the microservice
./scripts/test.sh

sleep 5;
kubectl delete service key-value-service -n default
kubectl delete deployment key-value-service -n default
