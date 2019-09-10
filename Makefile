###################################
#          PARAMETROS             #
##################################

PATH_APP_ANSIBLE = ${PWD}

help:
	@echo "COMANDOS - SYADMIN TB CODA"
	@echo "\t > implantar-ambiente - Criar ambiente"
	@echo "\t > recuperar-ambiente - Recuperar ambiente"
	@echo "\t > desalocar-ambiente - Apaga tudo"

implantar-ambiente:
	@@echo "CRIANDO AMBIENTE" && \
	cd $(PATH_APP_ANSIBLE) && \
	git pull && \
	export ANSIBLE_HOST_KEY_CHECKING=False && time ansible-playbook provisioning.yml && \
	export ANSIBLE_HOST_KEY_CHECKING=False && time ansible-playbook gambi.yml && \
	export ANSIBLE_HOST_KEY_CHECKING=False && time ansible-playbook -i inventory/gcp.yml services.yml
recuperar-ambiente:
	@@echo "RECUPERANDO AMBIENTE" && \
	cd $(PATH_APP_ANSIBLE) && \
	git pull && \
	export ANSIBLE_HOST_KEY_CHECKING=False && time ansible-playbook provisioning.yml ; \
	export ANSIBLE_HOST_KEY_CHECKING=False && time ansible-playbook gambi.yml && \
	export ANSIBLE_HOST_KEY_CHECKING=False && time ansible-playbook -i inventory/gcp.yml services.yml

desalocar-ambiente:
	@@echo "DESTRUINDO AMBIENTE" && \
	cd $(PATH_APP_ANSIBLE) && \
	git pull && \
	export ANSIBLE_HOST_KEY_CHECKING=False && time ansible-playbook -i inventory/gcp.yml desprovisioning.yml
