# provider "cloudflare" {
#   email = "exxmanster@gmail.com"
#   api_key = var.cf_api_key
# }


# resource "cloudflare_record" "devops4_cname" {
#   zone_id = var.cf_devops4_zone_id
#   name    = var.cf_domain
#   value   = aws_alb.green.dns_name
#   type    = "CNAME"
#   proxied = true
# }