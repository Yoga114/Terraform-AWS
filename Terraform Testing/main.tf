provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

module "VPC" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = data.aws_availability_zones.available.names
}

module "EC2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  volume_type   = var.volume_type
  volume_size   = var.volume_size
  instance_type = var.instance_type
  subnet_id     = module.VPC.public_subnet_ids[1]
  vpc_id        = module.VPC.vpc_id
  key_name      = var.key_name
  allowed_ip     = var.allowed_ip
  instance_name = var.instance_name
}

module "RDS" {
  source               = "./modules/rds"
  db_identifier        = var.db_identifier
  allocated_storage    = var.rds_allocated_storage
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  db_name              = var.rds_db_name
  username             = var.rds_username
  password             = var.rds_password
  security_group_ids   = var.rds_security_group_ids
  vpc_id               = module.VPC.vpc_id
  db_subnet_group_name = var.db_subnet_group_name
  multi_az             = var.multi_az
  storage_type         = var.storage_type
  publicly_accessible  = var.publicly_accessible
  private_subnet_ids   = module.VPC.private_subnet_ids
}
