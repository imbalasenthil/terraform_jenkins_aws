# This file references the resources and sets the necessary variables.
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_tag" {
  default = "my-vpc"
}

variable "subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "subnet_tag" {
  default = "my-subnet"
}

variable "internet_gateway_tag" {
  default = "my-igw"
}

variable "ec2_role_name" {
  default = "ec2_role"
}

variable "ec2_instance_profile_name" {
  default = "ec2_instance_profile"
}

variable "ec2_role_policy_name" {
  default = "ec2_role_policy"
}

variable "ec2-trust-policy" {
  default = "trust-policy.json"
}

variable "ec2-s3-permissions" {
  default = "s3-permissions.json"
}

variable "bucket_name" {
  default = "rayblackteam"
}

variable "security_group_name" {
  default = "my-security-group"
}

variable "ami" {
  default = "ami-0dfcb1ef8550277af"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_key_name" {
  default = "cli-dev-proj"
}

variable "ec2_user_data" {
  description = "User data script for EC2"
  type        = string
  default     = <<EOF
#!/bin/bash
# Install Jenkins and Java 
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum -y upgrade
# Add required dependencies for the jenkins package
sudo amazon-linux-extras install -y java-openjdk11 
sudo yum install -y jenkins
sudo systemctl daemon-reload

# Start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Firewall Rules
if [[ $(firewall-cmd --state) = 'running' ]]; then
    YOURPORT=8080
    PERM="--permanent"
    SERV="$PERM --service=jenkins"

    firewall-cmd $PERM --new-service=jenkins
    firewall-cmd $SERV --set-short="Jenkins ports"
    firewall-cmd $SERV --set-description="Jenkins port exceptions"
    firewall-cmd $SERV --add-port=$YOURPORT/tcp
    firewall-cmd $PERM --add-service=jenkins
    firewall-cmd --zone=public --add-service=http --permanent
    firewall-cmd --reload
fi
EOF
}

variable "ec2_tag" {
  default = "jenkins-server"
}
