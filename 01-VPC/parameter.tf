resource "aws_ssm_parameter" "roboshop_vpc" {
  name  = "/${var.Project_Name}/${var.Environment}/vpc-id"
  type  = "String"
  value = module.vpc_infra.roboshop_vpc_id
}

resource "aws_ssm_parameter" "deafult_vpc" {
  name  = "/${var.Project_Name}/${var.Environment}/default-vpc-id"
  type  = "String"
  value = module.vpc_infra.default_id
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.Project_Name}/${var.Environment}/public-subnet-ids"
  type  = "StringList"
  value = join(",",module.vpc_infra.public_subnet_id)
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.Project_Name}/${var.Environment}/private-subnet-ids"
  type  = "StringList"
  value = join(",",module.vpc_infra.private_subnet_id)
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.Project_Name}/${var.Environment}/database-subnet-ids"
  type  = "StringList"
  value = join(",",module.vpc_infra.database_subnet_id)
}