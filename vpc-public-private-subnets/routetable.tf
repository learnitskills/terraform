resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {
    "Name" = var.pubrt
  }
}

resource "aws_route_table" "pri_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id

  }

  tags = {
    "Name" = var.prirt
  }
}

resource "aws_route_table_association" "pub-rt" {
  subnet_id      = aws_subnet.pubsub.*.id[count.index]
  route_table_id = aws_route_table.pub_rt.id
  count          = 2
}


resource "aws_route_table_association" "pri-rt" {
  subnet_id      = aws_subnet.prisub.*.id[count.index]
  route_table_id = aws_route_table.pri_rt.id
  count          = 2
}
