output "miniflux_client_id" {
  value       = pocketid_client.miniflux.id
  description = "Pocket ID OIDC client ID for Miniflux"
}

output "miniflux_client_secret" {
  value       = pocketid_client.miniflux.client_secret
  description = "Pocket ID OIDC client secret for Miniflux"
  sensitive   = true
}

output "jellyfin_client_id" {
  value       = pocketid_client.jellyfin.id
  description = "Pocket ID OIDC client ID for Jellyfin"
}

output "jellyfin_client_secret" {
  value       = pocketid_client.jellyfin.client_secret
  description = "Pocket ID OIDC client secret for Jellyfin"
  sensitive   = true
}
