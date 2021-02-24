resource "aws_launch_configuration" "as_conf" {
  name          = "webserver_launch_config"
  image_id      = data.aws_ami.centos.image_id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.allow_tls.id]
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  echo "<html><body><p id="datetime"> Hello World, Current date and time is:
                  <script> var dt = new Date();document.getElementById("datetime").innerHTML=dt.toLocaleString();</script>
                  </p></body></html>" >> /var/www/html/index.html
                  sudo systemctl enable httpd
                  sudo systemctl start httpd
                  EOF
}