resource "aws_autoscaling_group" "bar" {
    name = "rxsavings-asg"
    max_size = 5
    min_size = 3
    launch_configuration = aws_launch_configuration.as_conf.name
    vpc_zone_identifier       = [aws_subnet.subnet-public-1.id, aws_subnet.subnet-public-2.id, aws_subnet.subnet-public-3.id, aws_subnet.subnet-public-4.id]
    target_group_arns  = ["${aws_lb_target_group.default.arn}"]
        
}
