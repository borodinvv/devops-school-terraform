provider "aws" {
  region = "us-east-2"
}


resource "aws_db_instance" "WeatherApp_DB" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "weather"
  username             = "weather"
  password             = random_password.db_master_pass.result
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  identifier = "weatherappdb"
  port = "3306"
  publicly_accessible     = true
  apply_immediately = true
  vpc_security_group_ids  = [aws_security_group.WeatherApp_Security_Group.id]
  tags = {
    Name  = "WeatherApp Database"
    Owner = "Vladislav Borodin"
  }
}


resource "aws_security_group" "WeatherApp_Security_Group" {
  name        = "WeatherApp Security Group"
  description = "WeatherApp Security Group"

  dynamic "ingress" {
    for_each = ["3306"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "WeatherApp Security Group"
    Owner = "Vladislav Borodin"
  }
}



