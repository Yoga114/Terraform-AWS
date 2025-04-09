variable "allocated_storage" {
  description = "Allocated storage (GB)"
  type        = number
}

variable "engine" {
  description = "Database engine (e.g. mysql, postgres)"
  type        = string
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "username" {
  description = "Database username"
  type        = string
}

variable "password" {
  description = "Database password"
  type        = string
  sensitive   = true
}


variable "security_group_ids" {
  description = "List of security group IDs for RDS"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Name of the subnet group for RDS"
  type        = string
}

variable "multi_az" {
  type        = bool
  description = "Multi AZ option"
}

variable "publicly_accessible" {
  type        = bool
  description = "The publicy accessible of the RDS"
}

variable "storage_type" {
  description = "RDS storage type"
  type        = string
}

variable "db_identifier" {
  type        = string
  description = "The identifier of the RDS instance"
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  description = "VPC ID to attach security group"
  type        = string
}