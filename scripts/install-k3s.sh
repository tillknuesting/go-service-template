#!/bin/bash

echo "Starting K3s cluster"
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.25.11+k3s1" K3S_KUBECONFIG_MODE=777 INSTALL_K3S_EXEC="server --disable traefik" sh -
mkdir -p ~/.kube
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
chmod 600 ~/.kube/config
