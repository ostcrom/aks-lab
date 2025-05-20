#!/bin/bash
#This script prompts the user for Azure credentials and sets up the environment
#for Terraform.

export arm_env_string="\
-var=azure_client_id=$azure_client_id \
-var=azure_client_secret=$azure_client_secret \
-var=azure_subscription_id=$azure_subscription_id \
-var=azure_tenant_id=$azure_tenant_id \
"
