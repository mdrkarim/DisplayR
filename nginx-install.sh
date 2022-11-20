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