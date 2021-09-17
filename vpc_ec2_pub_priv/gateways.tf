resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "hcl_igw"
  }
}



resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pubsub.id

  tags = {
    Name = "hcl_nat"
  }

  depends_on = [aws_internet_gateway.igw]
}



## EIP ##

resource "aws_eip" "eip" {
  vpc = true
}

