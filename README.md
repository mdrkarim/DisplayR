# DisplayR Task
Task Details: 1. Set up a hello world web server in AWS/Azure
              2. Provide a script to run server health checks periodically and externally.

Task-1 Solution: WebServer Provisioning on AWS using Terraform
Terraform part :
Create a private key
Create a key-pair on amazon
Create VPC, Subnet, Route Table, Internet Gateway
Create security group
Create ec2 instance
Execute User Data
Execute Ansible Playlist to copy/create cron job/run the script 


CMD: 
1. aws configure --profile yourProfilename
2. Terraform init
3. Terraform plan
4. Terraform apply

Task-2 Solution: Provide a script to run server health checks periodically and externally
This is also automatic through Ansible.
Terraform will run the Ansible Playybooks.




