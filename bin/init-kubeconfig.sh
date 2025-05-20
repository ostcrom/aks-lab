#!/bin/bash
# This script initializes the kubeconfig for the AKS cluster.

#Source docker functions run needed apps.
source ./bin/docker-functions.sh

cd terraform/azure
## Echo the kubeconfig to a file, strip the first and last lines which
## are erroneous.
echo "$(terraform output kube_config)" | sed '1d;$d' > ../../.kubeconfig
