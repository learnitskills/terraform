variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "subnet_cidr" {
  default = ["192.168.1.0/24", "192.168.2.0/24"]
}


variable "az" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "ami" {
  default = "ami-00dfe2c7ce89a450b"
}


variable "type" {
  default = "t2.micro"
}


variable "key" {
  default = "ohio"
}


variable "root_device_size" {
  default = "8"
}


variable "root_device_type" {
  default = "gp2"
}


variable "sg_cidr_blocks_bastion" {
  default = ["103.164.210.199/32"]
}


