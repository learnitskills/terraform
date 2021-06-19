resource "aws_subnet" "pubsub" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.pubsub_cidr, count.index)
  availability_zone = element(var.pub_az, count.index)
  count             = 2

  tags = {
    Name = element(var.pubsubname, count.index)
  }
}



resource "aws_subnet" "prisub" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.prisub_cidr, count.index)
  availability_zone = element(var.pri_az, count.index)
  count             = 2

  tags = {
    Name = element(var.prisubname, count.index)
  }
}