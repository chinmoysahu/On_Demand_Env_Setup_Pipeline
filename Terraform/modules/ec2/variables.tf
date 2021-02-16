# AWS Region
variable "region_val" {
  description = "region for provider"
  type        = string
  default     = "us-east-1"
}

# EC2 instance AMI
variable "web_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-047a51fa27710816e"
    us-east-2 = "TBD"
  }
}

# EC2 instances count
variable "web_ec2_count" {
  description = "Num of ec2 instances for web"
  type        = string
  default     = "1"
}

# EC2 instance size
variable "web_instance_type" {
  description = "Instance type for web"
  type        = string
  default     = "t2.micro"
}

# Tag for the server - K8s mangement server; Web server etc
variable "web_tags" {
  type = map(string)
  default = {
    Name = "Webserver"
  }
}

# EC2 instances count
variable "app_port" {
  description = "Application Port"
  type        = string
  default     = "80"
}

variable "traffic_cidr" {
  description = "CIDR for Traffic SG"
  type        = string
  default     = "0.0.0.0/0" #Allow all by default
}
