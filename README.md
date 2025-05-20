# AKS Lab

A modular Azure Kubernetes Service (AKS) deployment lab with Terraform, Traefik, and Let's Encrypt. The perfect platform for learning and testing Kubernetes.

## Overview

This repository contains a complete deployment of a Kubernetes environment on Azure Kubernetes Service (AKS) with supporting components:

- AKS cluster provisioned using Terraform
- Traefik as an ingress controller
- SSL certificate management with cert-manager and Let's Encrypt
- Sample "whoami" application for testing

The project uses containerized tools to ensure all commands run consistently across environments.

## Architecture

### Infrastructure

- **Azure Resources**: Provisioned using Terraform modules
  - Core module: Resource groups and common resources
  - Network module: VNet and subnet configuration
  - AKS module: Kubernetes cluster
  - SSH module: SSH key generation for cluster access
  - DNS module: Azure DNS configuration

### Kubernetes Components

- **Traefik**: Serves as the Kubernetes ingress controller
- **cert-manager**: Handles SSL certificate provisioning from Let's Encrypt
- **Whoami**: Sample application for testing the complete pipeline

## Prerequisites

- Azure Service Principal with Contributor permissions (refer to the ['Create a Service Principal'](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure-with-service-principle?tabs=bash#create-a-service-principal) section of this article.)
- A custom domain name that you are able to configure nameserver(ns) records for.
- A Linux environment with:
  - Docker installed
  - Make installed


## Environment Variables

Set the following environment variables before deployment:


## Installation

### Step 1: Run make install target:

To install, you simply need to pass the relevant environment variables to the make command and run the install target:


```bash
azure_client_id=<your-client-id> \
azure_client_secret=<your-client-secret> \
azure_subscription_id=<your-subscription-id> \
azure_tenant_id=<your-tenant-id> \
custom_domain=<your-domain.com> \
make install
```

#### Step 2: Configure DNS

After deployment, the build output will display the DNS nameservers for your Azure DNS zone. You will need to update your domain registrar with these nameservers. You can also run this command to display the nameservers:

```bash
source bin/docker-functions.sh
cd terraform/azure
terraform output dns_name_servers
```

After updating the DNS records, allow 10-15 minutes for the changes to propagate. You can check the status of your DNS records using:

```bash
dig lb.<your-domain.com> @8.8.8.8
```

It may also take a few minutes for the Let's Encrypt certificate to be issued.

## Usage

After installation, you can access:

- The whoami application at `https://whoami.<your-domain.com>` (if DNS is configured)

The kubernetes config file will be saved to .kubeconfig in the project's root directory. This can be used to interact with the AKS cluster.

## Cleanup

To remove all deployed resources:

```bash
azure_client_id=<your-client-id> \
azure_client_secret=<your-client-secret> \
azure_subscription_id=<your-subscription-id> \
azure_tenant_id=<your-tenant-id> \
custom_domain=<your-domain.com> \
make uninstall
```

## Directory Structure

- `/terraform`: Terraform configurations for Azure infrastructure
  - `/azure`: Main Terraform configuration
  - `/azure/modules`: Modular Terraform components
- `/bin`: Shell scripts for deployment and management
- `/kube`: Kubernetes manifests organized by component
  - `/kube/cert-manager`: Certificate issuer configuration
  - `/kube/traefik`: Traefik configuration
  - `/kube/whoami`: Sample application deployment

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
