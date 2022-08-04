data "digitalocean_ssh_key" "mb" {
  name = "mb"
}

variable "pvt_key" {
  default = "/Users/moonblade/.ssh/id_rsa"
}
variable "pub_key" {
  default = "/Users/moonblade/.ssh/id_rsa.pub"
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
  provisioner "remote-exec" {
    inline = [
      "echo setup complete!"
    ]
    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }
  provisioner "local-exec" {
		command = "	sed \"s/IP_ADDRESS/${self.ipv4_address}/g\" ansible/hosts.tpl > ansible/hosts; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i ansible/hosts --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' ansible/*.yml"
  }
}

output "droplet_ip" {
  value = digitalocean_droplet.vpn.ipv4_address
}
