#!/bin/bash

kubectl apply -f deployment/deployment.yaml -n default

elapsed=0
while [[ $elapsed -lt 60 ]]; do
  deployment_status=$(kubectl get deployment key-value-service -n default -o jsonpath='{.status.conditions[?(@.type=="Available")].status}')
  replicas_ready=$(kubectl get deployment key-value-service -n default -o jsonpath='{.status.readyReplicas}')
  replicas_desired=$(kubectl get deployment key-value-service -n default -o jsonpath='{.spec.replicas}')

  if [[ $deployment_status == "True" ]] && [[ $replicas_ready -eq $replicas_desired ]]; then
    echo "Microservice deployment is ready."
    break
  elif [[ $deployment_status == "Error" ]]; then
    echo "Microservice deployment encountered an error. Printing debug information..."
    kubectl describe deployment key-value-service -n default
    kubectl logs --tail=50 deployment/key-value-service -n default
    kubectl get events --field-selector involvedObject.name=key-value-service -n default
    exit 1
  fi

  echo "Microservice deployment is not ready yet. Waiting..."
  sleep 10
  elapsed=$((elapsed+10))
done

if [[ $elapsed -ge 60 ]]; then
  echo "Timeout exceeded. Microservice deployment is not ready within the specified time."
  echo "Printing debug information..."
  kubectl describe deployment key-value-service -n default
  kubectl logs --tail=50 deployment/key-value-service -n default
  kubectl get events --field-selector involvedObject.name=key-value-service -n default
  exit 1
fi
