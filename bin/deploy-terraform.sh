#!/bin/bash
# This script deploys the AKS cluster and installs the necessary components.
#
#Source docker functions run needed apps.
source ./bin/docker-functions.sh

echo "Deploying AKS cluster..."

tf_env_string="\
-var=azure_client_id=$azure_client_id \
-var=azure_client_secret=$azure_client_secret \
-var=azure_subscription_id=$azure_subscription_id \
-var=azure_tenant_id=$azure_tenant_id \
-var=custom_domain=$custom_domain \
"
cd ./terraform/azure

if ! [ -d ./.terraform ]; then
  echo "Terraform not initialized. Initializing..."
  terraform init
else
  echo "Terraform already initialized."
fi

terraform apply -auto-approve $tf_env_string
