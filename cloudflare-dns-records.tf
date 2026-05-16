resource "cloudflare_dns_record" "pocket_id" {
  zone_id = cloudflare_zone.primary.id
  name    = "id.${var.primary_domain}"
  content = var.charlie_ipv4_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "attic" {
  zone_id = cloudflare_zone.primary.id
  name    = "attic.${var.primary_domain}"
  content = var.alfa_ipv4_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "atuin" {
  zone_id = cloudflare_zone.primary.id
  name    = "atuin.${var.primary_domain}"
  content = var.bravo_ipv4_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "jellyfin" {
  zone_id = cloudflare_zone.primary.id
  name    = "jellyfin.${var.primary_domain}"
  content = var.shodan_ipv4_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "seerr" {
  zone_id = cloudflare_zone.primary.id
  name    = "request.${var.primary_domain}"
  content = var.shodan_ipv4_address
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "seerr_cname" {
  zone_id = cloudflare_zone.primary.id
  name    = "requests.${var.primary_domain}"
  content = cloudflare_dns_record.seerr.name
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
