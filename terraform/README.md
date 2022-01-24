<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                         | Version |
| ---------------------------------------------------------------------------- | ------- |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                      | ~> 3.0  |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0  |

## Providers

| Name                                                                   | Version |
| ---------------------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws)                      | 3.72.0  |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.7.0   |

## Modules

| Name                                                         | Source         | Version |
| ------------------------------------------------------------ | -------------- | ------- |
| <a name="module_ec2-db"></a> [ec2-db](#module\_ec2-db)       | .//modules/ec2 | n/a     |
| <a name="module_ec2-php1"></a> [ec2-php1](#module\_ec2-php1) | .//modules/ec2 | n/a     |
| <a name="module_ec2-php2"></a> [ec2-php2](#module\_ec2-php2) | .//modules/ec2 | n/a     |
| <a name="module_ec2-web1"></a> [ec2-web1](#module\_ec2-web1) | .//modules/ec2 | n/a     |
| <a name="module_ec2-web2"></a> [ec2-web2](#module\_ec2-web2) | .//modules/ec2 | n/a     |
| <a name="module_vpc"></a> [vpc](#module\_vpc)                | .//modules/vpc | n/a     |

## Resources

| Name                                                                                                                                            | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_alb.blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb)                                                 | resource    |
| [aws_alb.green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb)                                                | resource    |
| [aws_alb_listener.web_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener)                           | resource    |
| [aws_alb_listener.web_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener)                          | resource    |
| [aws_alb_listener_rule.php_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule)                 | resource    |
| [aws_alb_listener_rule.php_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener_rule)                | resource    |
| [aws_alb_target_group.php_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group)                   | resource    |
| [aws_alb_target_group.php_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group)                  | resource    |
| [aws_alb_target_group.web_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group)                   | resource    |
| [aws_alb_target_group.web_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group)                  | resource    |
| [aws_alb_target_group_attachment.php1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group_attachment) | resource    |
| [aws_alb_target_group_attachment.php2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group_attachment) | resource    |
| [aws_alb_target_group_attachment.web1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group_attachment) | resource    |
| [aws_alb_target_group_attachment.web2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group_attachment) | resource    |
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)                                    | resource    |
| [aws_key_pair.ssh-key-from-bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)                       | resource    |
| [aws_key_pair.ssh-key-to-bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)                         | resource    |
| [aws_security_group.alb_blue_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                    | resource    |
| [aws_security_group.alb_green_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                   | resource    |
| [cloudflare_record.devops4_cname](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record)                   | resource    |
| [aws_ami.ama2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)                                              | data source |
| [aws_ami.redhat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)                                            | data source |

## Inputs

| Name                                                                                           | Description | Type     | Default                              | Required |
| ---------------------------------------------------------------------------------------------- | ----------- | -------- | ------------------------------------ |:--------:|
| <a name="input_cf_api_key"></a> [cf\_api\_key](#input\_cf\_api\_key)                           | n/a         | `any`    | n/a                                  | yes      |
| <a name="input_cf_devops4_zone_id"></a> [cf\_devops4\_zone\_id](#input\_cf\_devops4\_zone\_id) | n/a         | `string` | `"177b98627222cd6af65f66067c8da515"` | no       |
| <a name="input_cf_domain"></a> [cf\_domain](#input\_cf\_domain)                                | n/a         | `string` | `"devops4edu.pp.ua"`                 | no       |
| <a name="input_region"></a> [region](#input\_region)                                           | n/a         | `string` | `"eu-central-1"`                     | no       |

## Outputs

| Name                                                                               | Description       |
| ---------------------------------------------------------------------------------- | ----------------- |
| <a name="output_ami"></a> [ami](#output\_ami)                                      | Ami image         |
| <a name="output_bastion_pub_ip"></a> [bastion\_pub\_ip](#output\_bastion\_pub\_ip) | Bastion Public IP |
| <a name="output_blue_alb_url"></a> [blue\_alb\_url](#output\_blue\_alb\_url)       | ALB Blue URL      |
| <a name="output_green_alb_url"></a> [green\_alb\_url](#output\_green\_alb\_url)    | ALB Green URL     |

<!-- END_TF_DOCS -->