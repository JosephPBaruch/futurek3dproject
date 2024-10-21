#!/bin/bash

set -e

cd ./frontend

if ! k3d registry list | grep -q "k3d-registry"; then
  echo "Create registry"
else
  echo "k3d registry already exists"
  k3d registry delete k3d-registry
fi

k3d registry create k3d-registry --port 5050 

# Check if k3d cluster already exists, create if not
if ! kubectl get secret | grep -q "my-registry-secret"; then
  echo "Create cluster"
else
  echo "k3d cluster already exists"
  kubectl delete secret my-registry-secret
fi

kubectl create secret docker-registry my-registry-secret \
  --docker-username=joe \
  --docker-password=joe \
  --docker-server=k3d-registry \

# Check if k3d cluster already exists, create if not
if ! k3d cluster list | grep -q "cluster"; then
  echo "Create cluster"
else
  echo "k3d cluster already exists"
  k3d cluster delete cluster
fi

k3d cluster create cluster -p "9900:80@loadbalancer" --registry-use k3d-registry:5050 --registry-config /workspaces/josephbaruch.com/registries.yaml

# k3d cluster create cluster -p "9900:80@loadbalancer"

docker tag frontend:latest localhost:5050/frontend:latest
docker push localhost:5050/frontend:latest

kubectl apply -f /workspaces/josephbaruch.com/deployment.yaml