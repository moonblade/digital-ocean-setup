terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.20.0"
    }
  }
}

provider "digitalocean" {
  token = chomp(file("${path.module}/do_token"))
}
