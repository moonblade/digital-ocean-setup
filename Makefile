init:
	terraform init

apply:
	terraform apply -auto-approve

plan:
	terraform plan 

ssh:
	ssh root@$(shell terraform output --raw droplet_ip) 

clean:
	terraform destroy

