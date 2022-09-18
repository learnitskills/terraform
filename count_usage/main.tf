TWO WAYS TO USE COUNT.


## MAKING USE OF ELEMENT 


resource "aws_subnet" "pubsub" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.az)
  cidr_block        = element(var.cidr,count.index)
  availability_zone = element(var.az,count.index)


  tags = {
    "Name" = "public_subnet"
  }
}





## SIMPLY USING COUNT WITH VARIABLE

resource "aws_subnet" "pubsub" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pubsub_cidr[count.index]
  availability_zone = var.pub_az[count.index]
  count             = length(var.az)

  tags = {
    Name = element(var.pubsubname, count.index)
  }
}




variable "az" {
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "cidr" {
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}


output "subnets" {
  value = aws_subnet.pubsub[*].id
}
