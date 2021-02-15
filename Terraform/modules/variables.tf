variable "region_val" {
  description = "region for provider"
  type        = string
  default     = "us-east-1"
}

variable "k8s_ami" {
  type = map(string)
  default = {
    us-east-1 = "ami-02c0975402ce3c32d"
    us-east-2 = "TBD"
  }
}

variable "ans_ami" {
  type = map(string)
  default = {
    us-east-1 = "TBD"
    us-east-2 = "TBD"
  }
}

variable "k8s_instance_type" {
  description = "Instance type for K8s master node"
  type        = string
  default     = "t2.micro"
}

variable "Ans_instance_type" {
  description = "Instance type for Ansible node"
  type        = string
  default     = "t2.micro"
}
