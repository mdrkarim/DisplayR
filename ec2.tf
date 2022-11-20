# This recource will create a ec2 instance with specified specs
resource "aws_instance" "ec2_instance" {
  ami                    = "ami-02a66f06b3557a897"            # this is a amazon linux ami id
  instance_type          = "t2.micro"
  key_name               = var.key_name
  
  tags = {
    Name = "webServer"
  }
  subnet_id = aws_subnet.displayr-subnet-1.id
  vpc_security_group_ids = [ "${aws_security_group.security_group.id}" ]
  user_data = file("nginx-install.sh")
/*
  user_data = <<-EOF
    #!/bin/bash -xe
    exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
    sudo yum update -y
    sudo amazon-linux-extras install nginx1 -y
    sudo su -c "/bin/echo 'Hello DisplayR' >/usr/share/nginx/html/index.html"
    instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
    sudo su -c "echo $instance_ip >>/usr/share/nginx/html/index.html"
    sudo systemctl start nginx
    sudo systemctl enable  nginx
    EOF
    */
    }