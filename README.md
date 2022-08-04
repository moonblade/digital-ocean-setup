# Digital ocean vpn

Sets up digital ocean vm (on lowest configuration), and installs wireguard on it. It also installs three clients on it called mac, iphone and android and downloads the config files to out folder.

Created this mostly to have some hands-on with ansible playbooks and terraform as well


## Pre requisites

- terraform
- GNU make
- ansible-playbook
- qrencode (optional)


## Steps

1. Add [digital ocean api token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) in do_token; alternatively run `git-crypt unlock` to get the existing token
2. [Add your ssh key in digital ocean](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/)
2. change variable `ssh_key_name` in droplet.tf
3. Initialize providers with `make init`
4. Create droplet and setup wireguaard with `make apply`
5. `make qr` to get qr code of the downloaded configurations




