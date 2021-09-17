resource "aws_security_group" "bastion-sg" {
  vpc_id = aws_vpc.vpc.id
  ingress {
    description = "bastion-sg"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr_blocks_bastion
  }

  egress {
    description = "bastion-sg"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }

}




resource "aws_security_group" "private-sg" {
  vpc_id     = aws_vpc.vpc.id
  depends_on = [aws_instance.pubvm]
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.pubvm.private_ip}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


  tags = {
    Name = "private-sg"
  }
}



