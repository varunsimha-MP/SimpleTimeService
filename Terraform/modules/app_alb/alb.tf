resource "aws_lb" "app" {
  name               = var.alb_name
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [aws_security_group.alb_sg.id]
}

resource "aws_lb_target_group" "app" {
  name     = var.alb_tg_name
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.core_network

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
    matcher             = "200"
  }
}

# HTTP → HTTPS REDIRECT
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


# HTTPS LISTENER
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.app.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-2016-08"
  certificate_arn = var.certificate_arn   # FROM ACM MODULE

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}


resource "aws_security_group" "alb_sg" {
    name = var.alb_sg_name
    description = var.alb_sg_description
    vpc_id = var.core_network
    dynamic "ingress" {
        for_each = var.alb_ingress
        content {
          description = ingress.value.description
          protocol = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_block
          to_port = ingress.value.port
          from_port = ingress.value.port
        }
    }
    tags = var.alb_sg
}