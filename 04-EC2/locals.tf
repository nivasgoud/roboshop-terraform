locals {
  ec2-name = "${var.ProjectName}-${var.Environment}"
  public_subnet_id = element(split(",",data.aws_ssm_parameter.public_subnet_id.value),0)
  private_subnet_id = element(split(",",data.aws_ssm_parameter.private_subnet_id.value),0)
  database_subnet_id = element(split(",",data.aws_ssm_parameter.database_subnet_id.value),0)
}