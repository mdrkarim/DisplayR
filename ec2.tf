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
	user_data = file("httpd-install.sh")  
  /*
    user_data     = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<html><body><div>Welcome to StackSimplify ! AWS Infra created using Terraform</div></body></html>" > /var/www/html/index.html
    EOF
  */
    }