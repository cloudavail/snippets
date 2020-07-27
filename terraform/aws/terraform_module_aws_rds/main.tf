provider "aws" {
  region = "us-west-2"
}

# resources
resource "aws_security_group" "rds_instance_security_group" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["127.0.0.1/32"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.vpc.id
}

resource "aws_db_subnet_group" "db_subnet_group" {
  subnet_ids = [aws_subnet.publicsubnet01.id, aws_subnet.publicsubnet02.id]
}

module "rds" {
  source                 = "terraform-aws-modules/rds/aws"
  version                = "~> 2.0"
  identifier             = "demodb"
  allocated_storage      = 5
  backup_window          = "03:00-06:00"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.id
  engine                 = "mysql"
  engine_version         = "8.0.20"
  family                 = "mysql8.0"
  instance_class         = "db.t3.micro"
  name                   = "demodb"
  # maintenance_window is required, although it is often expected that maintenance_window be assigned by AWS
  maintenance_window     = "Mon:00:00-Mon:03:00"
  major_engine_version   = "8.0"
  password               = var.db_password
  port                   = "3306"
  # in production environments, publicly_accessible should almost always be set to false
  publicly_accessible    = true
  subnet_ids             = [aws_subnet.publicsubnet01.id, aws_subnet.publicsubnet02.id]
  username               = "user"
  vpc_security_group_ids = [aws_security_group.rds_instance_security_group.id]
}
