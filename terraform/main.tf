terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
     }

    
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_key_pair" "ssh-key-to-bastion" {
  key_name   = "to-bastion-key"
  public_key = file("id_rsa.pub")
}

resource "aws_key_pair" "ssh-key-from-bastion" {
  key_name   = "from-bastion-key"
  public_key = file("bastion_id.pub")
}
