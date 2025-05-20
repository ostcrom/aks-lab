#!/bin/bash
# This script updates the DNS records to point at the kubernetes ingress.
source ./bin/docker-functions.sh
source ./bin/init-terraform-env.sh
source ./bin/init-dns-env.sh

cd ./custom-domain

terraform apply $arm_env_string $dns_env_string -var="lb_ip=$lb_ip" -var="db_ip=$db_ip" -auto-approve
