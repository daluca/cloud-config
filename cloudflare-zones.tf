resource "cloudflare_zone" "primary" {
  name = var.primary_domain
  account = {
    id = data.cloudflare_account.primary.account_id
  }
}
