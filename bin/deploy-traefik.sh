#!/bin/bash
#This 

#Source docker functions run needed apps.
source ./bin/docker-functions.sh

##Add needed repositories for helm
helm repo add jetstack https://charts.jetstack.io
helm repo add traefik https://traefik.github.io/charts
helm repo update

echo "Installing Traefik ingress controller"
helm install traefik-ingress traefik/traefik \
  -n kube-system \

echo "Installing cert-manager"
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.17.2 \
  --set crds.enabled=true

echo "Installing letsencrypt prod cluster issuer"
kubectl apply -f kube/cert-manager/letsencrypt-prod.yml

echo "Installing https redirect middleware"
kubectl apply -f kube/traefik/traefik-https-redirect.yml

echo "Patching externalTrafficPolicy to Local"
kubectl patch svc traefik-ingress \
	-n kube-system \
	--patch-file \
	kube/traefik/external-traffic-policy-local-patch.yml \

