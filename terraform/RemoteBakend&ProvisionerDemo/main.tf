provider "aws" {
  region = var.region_value
}

resource "aws_key_pair" "demokey" {
  key_name = "demokey"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_vpc" "demoVpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "demoSub" {
  vpc_id = aws_vpc.demoVpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "demoIgw" {
  vpc_id = aws_vpc.demoVpc.id
}

resource "aws_route_table" "demoRT" {
  vpc_id = aws_vpc.demoVpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demoIgw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.demoSub.id
  route_table_id = aws_route_table.demoRT.id
}

resource "aws_security_group" "demoSG" {
  name = "WebSG"
  vpc_id = aws_vpc.demoVpc.id

  ingress {
    description = "SSH connection"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }

  ingress {
    description = "HTTP connection"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "Web-SG"
  }
}

resource "aws_instance" "demo_instance" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  key_name = aws_key_pair.demokey.key_name
  vpc_security_group_ids = [ aws_security_group.demoSG.id ]
  subnet_id = aws_subnet.demoSub.id

  tags = {
    Name = "Terraform"
  }
  
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ec2-user/app.py"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the demo instance'",
      "sudo yum update -y",
      "sudo yum install -y python3-pip",
      "cd /home/ec2-user",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
  }
}

