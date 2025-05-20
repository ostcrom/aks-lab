#!/bin/bash
# This script updates the DNS records to point at the kubernetes ingress.
source ./bin/docker-functions.sh

echo "Updating DNS records..."

ingress_ip=$(kubectl get svc traefik-ingress \
	-n kube-system \
	-o jsonpath="{.status.loadBalancer.ingress[0].ip}" \
	| awk -F% '{print $1}')

tf_env_string="\
-var=azure_client_id=$azure_client_id \
-var=azure_client_secret=$azure_client_secret \
-var=azure_subscription_id=$azure_subscription_id \
-var=azure_tenant_id=$azure_tenant_id \
-var=custom_domain=$custom_domain \
-var=ingress_ip=$ingress_ip \
-var=phase2=true \
"

cd ./terraform/azure

if ! [ -d .terraform ]; then
	echo "Terraform not initialized, it should be initialized by the previous step. Aborting, please check the previous step."
	exit 1
fi

terraform apply \
	$tf_env_string \
	-auto-approve
