variable "subnet_ids" {
  description = "This variable states the subnets for your EKS"
  default     = []
}

variable "instance" {
  description = "This variable states the instance type for your EC2"
  default     = "t2.micro"
}