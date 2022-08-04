init:
	terraform init
	mkdir out

apply:
	terraform apply -auto-approve

plan:
	terraform plan 

ssh:
	ssh-keygen -R vpn
	ssh vpn
	# ssh root@$(shell terraform output --raw droplet_ip) 

qr:
	@for filename in $(shell ls out/); do \
		echo $$filename; \
		qrencode -t ansiutf8 -l L <"out/$$filename"; \
	done

ip:
	@terraform output --raw droplet_ip

clean:
	terraform destroy

.PHONY: ansible
ansible:
	sed "s/IP_ADDRESS/$(shell terraform output --raw droplet_ip)/g" ansible/hosts.tpl > ansible/hosts
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/hosts -u root ansible/setup.yml


