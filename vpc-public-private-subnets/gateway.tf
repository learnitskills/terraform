resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "tf-igw"
  }
}



resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.pubsub[0].id 


  tags = {
    Name = "tf-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "eip" {
  vpc = true
}