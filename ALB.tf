# Web Load Balancing
resource "aws_alb" "web-load-balancer" {
  name            = "web-load-balancer"
  security_groups = [aws_security_group.web-alb-sg.id]

  subnets = [
      aws_subnet.web-subnet-1.id,
      aws_subnet.web-subnet-2.id,
      aws_subnet.web-subnet-3.id
  ]
}
resource "aws_alb_target_group" "web-ecs-target-group" {
  name     = "web-ecs-target-group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.team1-vpc.id

  health_check {
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    interval            = "30"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
  }

  depends_on = [
    aws_alb.web-load-balancer,
  ]

  tags = {
    Name = "web-ecs-target-group"
  }
}

resource "aws_alb_listener" "public-alb-listener" {
  load_balancer_arn = aws_alb.web-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.web-ecs-target-group.arn
    type             = "forward"
  }
}

# App Load Balancing

resource "aws_alb" "app-load-balancer" {
  name            = "app-load-balancer"
  security_groups = [aws_security_group.app-alb-sg.id]

  subnets = [
    aws_subnet.app-subnet-1.id,
    aws_subnet.app-subnet-2.id,
    aws_subnet.app-subnet-3.id
  ]
}

resource "aws_alb_target_group" "app-ecs-target-group" {
  name     = "app-ecs-target-group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = aws_vpc.team1-vpc.id

  health_check {
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    interval            = "30"
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "5"
  }

  depends_on = [
    aws_alb.app-load-balancer,
  ]

  tags = {
    Name = "app-ecs-target-group"
  }
}

resource "aws_alb_listener" "app-alb-listener" {
  load_balancer_arn = aws_alb.app-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.app-ecs-target-group.arn
    type             = "forward"
  }
}
