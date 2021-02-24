resource "aws_lb" "test" {
    name               = "rxelb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.allow_tls.id]
    subnets            = [aws_subnet.subnet-public-1.id, aws_subnet.subnet-public-3.id ]
    enable_deletion_protection = true
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
    }
  }



resource "aws_lb_target_group" "default" {
    name   = "rxtargetgroup"
    vpc_id = aws_vpc.main.id
    port = 80
    protocol = "HTTP"
    target_type = "instance"
}

# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = aws_lb_target_group.default.arn
#   target_id        = aws_instance.test.id
#   port             = 80
# }