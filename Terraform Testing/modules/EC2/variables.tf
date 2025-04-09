variable "ami_id" {
  description = "Ami AWS ID"
  type = string
}

variable "instance_type" {
  description = "Type of the Instance"
  type = string
}

variable "key_name" {
  description = "SSH Key Name"
  type = string
}


variable "instance_name" {
  description = "EC2 Instance Name"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to attach security group"
  type        = string
}

variable "allowed_ip" {
  description = "CIDR IP to allow SSH"
  type        = string
}

variable "volume_size" {
  type        = string
  description = "The size for the EBS volume"
}

variable "volume_type" {
    description = "The storage type of the EBS"
    type = string
}