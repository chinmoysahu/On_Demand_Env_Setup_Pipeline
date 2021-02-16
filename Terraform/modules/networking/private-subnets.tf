# Create private subnet for first 2 AZs only
resource "aws_subnet" "private" {
  count             = length(slice(local.az_names, 0, 2))
  vpc_id            = aws_vpc.my_app.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + local.num_of_az) # Assign CIDR blocks with spacing of num AZs
  availability_zone = local.az_names[count.index]
  tags = {
    Name = "PrivSubnet-${count.index + 1}"
  }
}

# Security Group for NAT instance
resource "aws_security_group" "nat_sg" {
  name        = "nat_sg"
  description = "Allow traffic for private instances"
  vpc_id      = aws_vpc.my_app.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create NAT instance to connect to Private RT
resource "aws_instance" "nat" {
  ami                    = var.nat_amis[var.region_val]
  instance_type          = "t2.micro"
  subnet_id              = local.pub_sub_ids[0] #Assign the first Public Subnet Id
  source_dest_check      = false
  vpc_security_group_ids = [aws_security_group.nat_sg.id]
  tags = {
    Name = "NatInstance"
  }
}

# Private Route table allowing connection with NAT
resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.my_app.id
  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.nat.id
  }
  tags = {
    Name = "PrivateRT"
  }
}

# Associate Routing table with Private Subnets
resource "aws_route_table_association" "private_sub_association" {
  count          = length(slice(local.az_names, 0, 2)) #Same as Priv Subnet configuration
  subnet_id      = local.pri_sub_ids[count.index]
  route_table_id = aws_route_table.privatert.id
}
