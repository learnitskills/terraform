resource "aws_instance" "pubvm" {
  ami                         = var.ami
  instance_type               = var.type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.pubsub.id
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  key_name                    = var.key
  monitoring                  = false

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }

  provisioner "file" {
    source      = "ohio.pem"
    destination = "/home/ec2-user/ohio.pem"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      #private_key = file("/home/opstree/learning/terraform/hcl/vpc_subnet_ec2_pub_priv/ohio.pem")
      private_key = file("${path.root}/ohio.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Bastion_host"
  }

}




resource "aws_instance" "privvm" {
  ami                         = var.ami
  instance_type               = var.type
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.privsub.id
  vpc_security_group_ids      = [aws_security_group.private-sg.id]
  key_name                    = var.key
  monitoring                  = false

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }

  tags = {
    Name = "Private_vm"
  }


}

