resource "pocketid_client" "miniflux" {
  name = "Miniflux"

  launch_url = "https://miniflux.${var.primary_domain}/"

  callback_urls = [
    "https://miniflux.${var.primary_domain}/oauth2/oidc/callback",
    "https://miniflux.${var.primary_domain}/oauth2/oidc/redirect",
  ]

  logout_callback_urls = [
    "https://miniflux.${var.primary_domain}/"
  ]

  pkce_enabled = true

  allowed_user_groups = [
    pocketid_group.miniflux.id,
  ]
}

resource "pocketid_client" "jellyfin" {
  name = "Jellyfin"

  launch_url = "https://jellyfin.${var.primary_domain}/"

  callback_urls = [
    "https://jellyfin.${var.primary_domain}/sso/OID/redirect/pocket-id",
  ]

  logout_callback_urls = [
    "https://jellyfin.${var.primary_domain}/"
  ]

  pkce_enabled = true

  allowed_user_groups = [
    pocketid_group.jellyfin.id,
    pocketid_group.jellyfin_admin.id,
  ]
}
