provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "example" {
  ami = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"

  tags = {
    Name = "Demo-Instance"
  }
}


output "ip" {
  value = aws_instance.example.public_ip
}
