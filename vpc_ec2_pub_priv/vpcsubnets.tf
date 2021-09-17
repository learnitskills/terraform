resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "hcl_vpc"
  }
}

resource "aws_subnet" "pubsub" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr[0]
  availability_zone       = var.az[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "HCL_Public_Subnet"
  }

}



resource "aws_subnet" "privsub" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr[1]
  availability_zone       = var.az[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "HCL_Private_Subnet"
  }

}