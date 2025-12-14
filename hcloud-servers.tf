data "hcloud_location" "nuremberg" {
  name = "nbg1"
}

resource "hcloud_server" "alfa" {
  name        = "alfa"
  image       = "ubuntu-24.04"
  server_type = "cx23"
  location    = data.hcloud_location.nuremberg.name

  firewall_ids = [
    hcloud_firewall.default.id,
    hcloud_firewall.http.id,
  ]

  ssh_keys = [
    hcloud_ssh_key.daluca.id
  ]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

resource "hcloud_server" "bravo" {
  name        = "bravo"
  image       = "ubuntu-24.04"
  server_type = "cax11"
  location    = data.hcloud_location.nuremberg.name

  firewall_ids = [
    hcloud_firewall.default.id,
    hcloud_firewall.http.id,
  ]

  ssh_keys = [
    hcloud_ssh_key.daluca.id
  ]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
