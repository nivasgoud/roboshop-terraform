
module "vpc_infra" {
  source = "git::https://github.com/nivasgoud/terraform-aws-vpc.git?ref=main"
  cidr = var.cidr
  ProjectName = var.Project_Name
  Environment = var.Environment
  public_subnet_cidr = var.public_subnet_cidr_test
  private_subnet_cidr = var.private_subnet_cidr_test
  database_subnet_cidr = var.database_subnet_cidr_test
  is_Peering = var.is_Peering
}
