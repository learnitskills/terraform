variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "pubsub_cidr" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "prisub_cidr" {
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}


variable "pubsubname" {
  default = ["tf-pubsub-1", "tf-pubsub-2"]
}

variable "prisubname" {
  default = ["tf-prisub-1", "tf-prisub-2"]
}


variable "pub_az" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "pri_az" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "pubrt" {
  default = "pub-rt"
}

variable "prirt" {
  default = "pri-rt"
}
