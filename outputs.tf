output "miniflux_client_id" {
  value       = pocketid_client.miniflux.id
  description = "Pocket ID OIDC client ID for Miniflux"
}

output "miniflux_client_secret" {
  value       = pocketid_client.miniflux.client_secret
  description = "Pocket ID OIDC client secret for Miniflux"
  sensitive   = true
}
