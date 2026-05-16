terraform {
  required_version = ">= 1.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }

    pocketid = {
      source  = "trozz/pocketid"
      version = "~> 0.1"
    }
  }
}

provider "pocketid" {
  base_url = "https://id.${var.primary_domain}"
}
