resource "pocketid_group" "miniflux" {
  name          = "miniflux"
  friendly_name = "Miniflux"
}

resource "pocketid_group" "jellyfin" {
  name          = "jellyfin"
  friendly_name = "Jellyfin"
}

resource "pocketid_group" "jellyfin_admin" {
  name          = "jellyfin-admin"
  friendly_name = "Jellyfin Administrator"
}
