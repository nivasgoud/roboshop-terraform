data "aws_ssm_parameter" "roboshop_vpc_id" {
  name = "/${var.ProjectName}/${var.Environment}/vpc-id"
}

data "aws_ssm_parameter" "default_vpc_id" {
  name = "/${var.ProjectName}/${var.Environment}/default-vpc-id"
}

