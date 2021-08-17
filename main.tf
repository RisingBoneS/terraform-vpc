terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  shared_credentials_file = var.creds
  profile = "default"
}

resource "aws_instance" "web" {
  ami                   = "ami-0c2b8ca1dad447f8a" 
  instance_type         = var.instance_type
  key_name              = var.instance_key
  subnet_id             = aws_subnet.publicsubnets.id
  security_groups       = [aws_security_group.public-web-sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing HTTPD"
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo "*** Completed Installing HTTPD"
  echo "<html><body><h1>My Training AWS WebServer</h1></body></html>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "web_instance"
  }

  volume_tags = {
    Name = "web_instance"
  } 
}

resource "aws_instance" "db" {
  ami                   = "ami-0c2b8ca1dad447f8a" 
  instance_type         = var.instance_type
  key_name              = var.instance_key
  subnet_id             = aws_subnet.privatesubnets.id
  security_groups       = [aws_security_group.private-db-sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing MySQL"
  sudo yum update -y
  sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
  sudo yum localinstall mysql57-community-release-el7-11.noarch.rpm -y
  sudo yum install mysql-community-server -y
  sudo systemctl start mysqld.service
  sudo systemctl enable mysqld.service
  echo "*** Completed Installing MySQL"
  EOF

  tags = {
    Name = "db_instance"
  }

  volume_tags = {
    Name = "db_instance"
  } 
}