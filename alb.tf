resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Hezekiah_SG.name]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true

  

  tags = {
    Environment = "production"
  }
}