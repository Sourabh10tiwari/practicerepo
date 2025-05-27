provider "aws" {
  region = var.region_value
}

variable "region_value" {
  description = "Value for the region"
}

variable "ami_value" {
  description = "ami id for the instance"
}

variable "instance_type_value" {
  description = "instance tpye for the instance"
}

variable "name_value" {
  description = "Name of the instance"
}

resource "aws_instance" "demo_instance" {
  ami = var.ami_value
  instance_type = var.instance_type_value

  tags = {
    Name = var.name_value
  }
}