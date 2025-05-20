#!/bin/bash
# This script deploys a simple web server that returns the hostname of the server.
source bin/docker-functions.sh

echo "Deploying whoami service..."

kubectl create namespace whoami || true
kubectl apply -f kube/whoami/deployment.yml -n whoami
kubectl apply -f kube/whoami/service.yml -n whoami
kubectl apply -f kube/whoami/ingress.yml -n whoami
