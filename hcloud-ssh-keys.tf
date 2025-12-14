resource "hcloud_ssh_key" "daluca" {
  name       = "daluca"
  public_key = file("~/.ssh/id_ed25519.pub")
}
