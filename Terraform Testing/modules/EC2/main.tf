 resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  ingress {
    from_port   = 433
    to_port     = 433
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "allow_ssh" }
}

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  root_block_device {
    volume_size           = var.volume_size       # Size in GB
    volume_type           = var.volume_type       # gp2, gp3, io1, etc.
    delete_on_termination = true
    encrypted             = true
  }

  tags = { Name = var.instance_name }
}


