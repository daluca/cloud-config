locals {
  global = [
    "0.0.0.0/0",
    "::/0"
  ]
}

resource "hcloud_firewall" "default" {
  name = "default"

  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = local.global
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = tostring(22)
    source_ips = local.global
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = tostring(22022)
    source_ips = local.global
  }
}

resource "hcloud_firewall" "http" {
  name = "http"

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = tostring(80)
    source_ips = local.global
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = tostring(443)
    source_ips = local.global
  }
}
