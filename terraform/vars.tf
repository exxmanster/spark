variable "region" {
    type = string
    default = "eu-central-1"
  
}
variable "cf_zone_id" {
    default = "42d495b2b5d7c20cae3d98efc8f1a357"

}

variable "green"{
    description = "Switch for Green ENV"
    type = bool
    default = false
}

variable "blue"{
    description = "Switch for Blue ENV"
    type = bool
    default = false
}

variable "cf_domain" {
    default = "devopsedu.xyz"
} 

variable "cf_api_key"{
    description = "CLoudflare API KEY"
    
}



    

