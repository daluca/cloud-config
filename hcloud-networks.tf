resource "hcloud_network" "default" {
  name     = "europe"
  ip_range = "10.2.0.0/16"
}

resource "hcloud_network_subnet" "default" {
  network_id   = hcloud_network.default.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.2.1.0/24"
}
