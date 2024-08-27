data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.ProjectName}/${var.Environment}/vpn_sg_id"
}

data "aws_ssm_parameter" "default_vpc_id" {
  name = "/${var.ProjectName}/${var.Environment}/default-vpc-id"
}


data "aws_subnet" "selected" {
  vpc_id = data.aws_ssm_parameter.default_vpc_id.value
  availability_zone = "us-east-1a"
}



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