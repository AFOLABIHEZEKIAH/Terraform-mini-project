resource "aws_instance" "web" {
  ami           = "ami-06e85d4c3149db26a"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.Hezekiah_SG.name]
  count = 3

  tags = {
    Name = "Hezekiah_instance"
  }
}

resource "aws_security_group" "Hezekiah_SG" {
  name        = "Hezekiah security group"
  description = "Hezekiah security group"
  vpc_id      = "vpc-0a6b35fcb729893c3"

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  

  tags = {
    Name = "Hezekiah_SG"
  }
}