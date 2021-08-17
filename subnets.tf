# Create a Public Subnets.
resource "aws_subnet" "publicsubnets" { # Creating Public Subnets
  vpc_id     = aws_vpc.training.id
  cidr_block = var.public_subnets # CIDR block of public subnets
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name = "PubSub 10.0.1.0 - us-east-1a"
  }
}

#  Create a Private Subnet                        # Creating Private Subnets
resource "aws_subnet" "privatesubnets" {
  vpc_id     = aws_vpc.training.id
  cidr_block = var.private_subnets # CIDR block of private subnetsi
  availability_zone = "us-east-1b"

  tags = {
    Name = "PrivSub 10.0.2.0 - us-east-1b"
  }
}
