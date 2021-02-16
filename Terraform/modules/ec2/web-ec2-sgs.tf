resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow traffic for ec2 instances"
  vpc_id      = aws_vpc.my_app.id

  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = [var.traffic_cidr]
  }

  ingress {
    from_port   = 22 #SSH port
    to_port     = 22 #SSH port
    protocol    = "tcp"
    cidr_blocks = [var.traffic_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.traffic_cidr]
  }
}
