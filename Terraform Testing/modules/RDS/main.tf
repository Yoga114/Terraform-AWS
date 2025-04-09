resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  multi_az             = var.multi_az
  storage_type         = var.storage_type
  identifier           = var.db_identifier
  publicly_accessible  = var.publicly_accessible
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot  = true

  tags = merge(
  var.tags,
  {
    Name = var.db_identifier
  }
)
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "db-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_security_group" "rds-sg" {
  name        = "rds-server-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/20"] 
  }

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["100.64.0.0/16"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}

