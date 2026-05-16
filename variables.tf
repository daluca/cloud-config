variable "primary_domain" {
  type        = string
  description = "Primary domain"
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare account ID"
}

variable "alfa_ipv4_address" {
  type        = string
  description = "alfa node IPv4 address"
}

variable "bravo_ipv4_address" {
  type        = string
  description = "bravo node IPv4 address"
}

variable "charlie_ipv4_address" {
  type        = string
  description = "charlie node IPv4 address"
}

variable "shodan_ipv4_address" {
  type        = string
  description = "shodan node IPv4 address"
}
