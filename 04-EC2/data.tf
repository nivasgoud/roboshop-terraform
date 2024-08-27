
data "aws_ami" "centos8" {
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "default_vpc_id" {
  name = "/${var.ProjectName}/${var.Environment}/default-vpc-id"
}


data "aws_subnet" "selected" {
  vpc_id = data.aws_ssm_parameter.default_vpc_id.value
  availability_zone = "us-east-1a"
}


data "aws_ssm_parameter" "vpn_id" {
  name = "/${var.ProjectName}/${var.Environment}/vpn_sg_id"
}

data "aws_ssm_parameter" "mongodb_id" {
  name = "/${var.ProjectName}/${var.Environment}/mongodb_sg_id"
}

data "aws_ssm_parameter" "cart_id" {
  name = "/${var.ProjectName}/${var.Environment}/cart_sg_id"
}

data "aws_ssm_parameter" "catalogue_id" {
  name = "/${var.ProjectName}/${var.Environment}/catalogue_sg_id"
}

data "aws_ssm_parameter" "user_id" {
  name = "/${var.ProjectName}/${var.Environment}/user_sg_id"
}

data "aws_ssm_parameter" "redis_id" {
  name = "/${var.ProjectName}/${var.Environment}/redis_sg_id"
}

data "aws_ssm_parameter" "mysql_id" {
  name = "/${var.ProjectName}/${var.Environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "shipping_id" {
  name = "/${var.ProjectName}/${var.Environment}/shipping_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_id" {
  name = "/${var.ProjectName}/${var.Environment}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "payment_id" {
  name = "/${var.ProjectName}/${var.Environment}/payment_sg_id"
}

data "aws_ssm_parameter" "web_id" {
  name = "/${var.ProjectName}/${var.Environment}/web_sg_id"
}

data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.ProjectName}/${var.Environment}/public-subnet-ids"
}

data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.ProjectName}/${var.Environment}/private-subnet-ids"
}

data "aws_ssm_parameter" "database_subnet_id" {
  name = "/${var.ProjectName}/${var.Environment}/database-subnet-ids"
}