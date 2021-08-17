resource "aws_eip" "nateIP" {
  vpc = true

  tags = {
    Name = "nateIP"
  }
}
# Creating the NAT Gateway using subnet_id and allocation_id
resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.nateIP.id
  subnet_id     = aws_subnet.publicsubnets.id

  tags = {
    Name = "NATgw"
  }
}
