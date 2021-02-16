variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
  default     = "10.10.0.0/16" #default VPC CIDR block - DEV
}

# Ubuntu AMI
variable "nat_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-02fe94dee086c0c37"
    us-east-2 = "TBD"
  }
}
