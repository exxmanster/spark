provider "cloudflare" {
  email = "exxmanster@gmail.com"
  api_key = "002376cdc964acf5a831afc3fc8907b297a6c"
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