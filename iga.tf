# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "IGW" { # Creating Internet Gateway
  vpc_id = aws_vpc.training.id          # vpc_id will be generated after we create VPC

  tags = {
    Name = "training_IGW"
  }
}
