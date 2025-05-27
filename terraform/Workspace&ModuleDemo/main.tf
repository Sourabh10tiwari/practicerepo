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

module "instance" {
  source = "./modules/ec2_instance"
  region_value = var.region_value
  ami_value = var.ami_value
  instance_type_value = var.instance_type_value
  name_value = var.name_value
}