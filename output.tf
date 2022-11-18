# Create Output of Public IP

output "public_ip" {
    value = "${aws_instance.ec2_instance.public_ip}"
}