resource "aws_alb" "green" {
  name               = "GreenELBv2"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.vpc.http_sg, module.vpc.ssh_sg]
  subnets            = [module.vpc.public_subnet_green_id, module.vpc.public_subnet_blue_id]

  tags = {
    Name = "GreenALB"
  }
}

resource "aws_alb_target_group" "web_green" {
  name     = "GreenWebTargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  tags = {
    Name = "Web Green TG"
  }
}

resource "aws_alb_target_group" "php_green" {
  name     = "GreenPhpTargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  tags = {
    Name = "PHP Green TG"
  }
}

resource "aws_alb_target_group_attachment" "web1" {

  target_group_arn = aws_alb_target_group.web_green.arn
  target_id        = module.ec2-web1.instance[0]
  port             = 80
}


resource "aws_alb_target_group_attachment" "php1" {
  target_group_arn = aws_alb_target_group.php_green.arn
  target_id        = module.ec2-php1.instance[0]
  port             = 80
}


resource "aws_alb_listener" "green" {
  load_balancer_arn = aws_alb.green.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.web_green.arn
  }
}


resource "aws_alb_listener_rule" "php_green" {
  listener_arn = aws_alb_listener.green.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.php_green.arn
  }

  condition {
    path_pattern {
      values = ["/phpmyadmin/*"]
    }
  }
}


resource "aws_security_group" "alb_green_sg" {
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
    Name = "alb_green_sg"
  }
}
