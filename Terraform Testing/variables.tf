variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "availability_zones" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "Ami AWS ID"
  type        = string
  default     = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  description = "Type of the Instance"
  type = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH Key Name"
  type = string
  default = "key-test"
}

variable "instance_name" {
  description = "EC2 Instance Name"
  type = string
  default = "EC2 Testing"
}

variable "volume_size" {
  type        = string
  default = "30"
  description = "The size for the EBS volume"
}

variable "volume_type" {
    description = "The storage type of the EBS"
    default = "gp3"
    type = string
}

variable "allowed_ip" {
  description = "CIDR block allowed to access the EC2 instance (e.g., your IP for SSH)"
  type        = string
  default     = "0.0.0.0/0" # ⚠️ Change this to your actual IP/CIDR for better security
}

# RDS

variable "db_identifier" {
  type        = string
  description = "The identifier of the RDS instance"
  default     = "testdata"
}
variable "rds_allocated_storage" {
  description = "Allocated storage for RDS"
  type        = number
  default     = 100
}
variable "rds_engine" {
  description = "RDS engine"
  type        = string
  default     = "postgres"
}
variable "rds_engine_version" {
  description = "RDS engine version"
  type        = string
  default     = "16.8"
}
variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t4g.micro"
}
variable "rds_db_name" {
  description = "RDS database name"
  type        = string
  default     = "testing"
}
variable "rds_username" {
  description = "RDS master username"
  type        = string
  default     = "root"
}
variable "rds_password" {
  description = "RDS master password"
  default     = "ecvid2025"
  type        = string
  sensitive   = true
}
/* variable "rds_parameter_group" {
  description = "RDS parameter group name"
  type        = string
  default     = "posgres16"
} */
variable "rds_security_group_ids" {
  description = "RDS security group IDs"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "RDS subnet group name"
  type        = string
  default     = "default-rds-custom"
}

variable "multi_az" {
  type        = bool
  description = "Multi AZ option"
  default     = false
}

variable "publicly_accessible" {
  type        = bool
  description = "The publicy accessible of the RDS"
  default     = false
}

variable "storage_type" {
  description = "RDS storage type"
  type        = string
  default     = "gp2"
}
