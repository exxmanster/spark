resource "aws_alb" "blue" {
  name               = "blueELBv2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.vpc.http_sg, module.vpc.ssh_sg]
  subnets            = [module.vpc.public_subnet1_id, module.vpc.public_subnet2_id]

  tags = {
    Name = "blueALB"
  }
}

resource "aws_alb_target_group" "web_blue" {
  name     = "WebTargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  tags = {
    Name = "Web blue TG"
  }
}

resource "aws_alb_target_group" "php_blue" {
  name     = "PhpTargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  tags = {
    Name = "PHP blue TG"
  }
}

resource "aws_alb_target_group_attachment" "web1" {

  target_group_arn = aws_alb_target_group.web_blue.arn
  target_id        = module.ec2-web2.instance[0]
  port             = 80
}


resource "aws_alb_target_group_attachment" "php1" {
  target_group_arn = aws_alb_target_group.php_blue.arn
  target_id        = module.ec2-php2.instance[0]
  port             = 80
}


resource "aws_alb_listener" "web_blue" {
  load_balancer_arn = aws_alb.blue.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.web.arn
  }
}


resource "aws_alb_listener_rule" "php_blue" {
  listener_arn = aws_alb_listener.web.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.php.arn
  }

  condition {
    path_pattern {
      values = ["/phpMyAdmin/*"]
    }
  }
}


resource "aws_security_group" "alb_blue_sg" {
  name        = "ELBv2 Grren Security group"
  description = "Allow all traffic to LB"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb_blue_sg"
  }
}
