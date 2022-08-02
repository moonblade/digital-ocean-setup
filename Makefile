init:
	terraform init

apply:
	terraform apply -auto-approve

plan:
	terraform plan 

ssh:
	# ssh vpn
	ssh root@$(shell terraform output --raw droplet_ip) 

ip:
	@terraform output --raw droplet_ip

clean:
	terraform destroy

