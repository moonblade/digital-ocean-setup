resource "digitalocean_droplet" "vpn" {
  image  = "ubuntu-20-04-x64"
  name   = "vpn"
  region = "ams3"
  size   = "s-1vcpu-512mb-10gb"
}
