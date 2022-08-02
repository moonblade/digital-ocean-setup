data "digitalocean_ssh_key" "mb" {
  name = "mb"
}

resource "digitalocean_droplet" "vpn" {
  image  = "ubuntu-20-04-x64"
  name   = "vpn"
  region = "ams3"
  size   = "s-1vcpu-512mb-10gb"
  ssh_keys = [
    data.digitalocean_ssh_key.mb.id,
  ]
  tags = ["vpn", "tf"]
}

output "droplet_ip" {
  value = digitalocean_droplet.vpn.ipv4_address
}
