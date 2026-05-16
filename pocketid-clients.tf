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
    pocketid_group.miniflux.id
  ]
}
