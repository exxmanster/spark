provider "cloudflare" {
  email = "exxmanster@gmail.com"
  api_key = var.cf_apikey
}


resource "cloudflare_record" "green_cname" {
  count = var.green ? 1 : 0
  zone_id = var.cf_zone_id
  name    = var.cf_domain
  value   = aws_alb.green.dns_name
  type = "CNAME"
  proxied = true
  allow_overwrite = true
    
    depends_on = [aws_alb.green, aws_alb.blue]
}

resource "cloudflare_record" "blue_cname" {
  count = var.blue ? 1 : 0
  zone_id = var.cf_zone_id
  name    = "devopsedu.xyz"
  value   = "${aws_alb.blue.dns_name}"
  type = "CNAME"
  proxied = false
 
    
    depends_on = [aws_alb.green, aws_alb.blue]
}