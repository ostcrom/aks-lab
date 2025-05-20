deploy_terraform:
	./bin/deploy-terraform.sh

deploy_traefik:
	./bin/init-kubeconfig.sh
	./bin/deploy-traefik.sh

update_dns:
	./bin/update-dns.sh

deploy_whoami:
	./bin/deploy-whoami.sh

install:
	@make deploy_terraform
	@make deploy_traefik
	@make deploy_whoami
	@make update_dns
uninstall:
	./bin/uninstall.sh
