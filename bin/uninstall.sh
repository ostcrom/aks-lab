#!/bin/bash
source ./bin/docker-functions.sh

echo "Deleting the AKS cluster...""

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

cd terraform/azure
terraform  apply \
	-destroy -auto-approve \
	$tf_env_string;
