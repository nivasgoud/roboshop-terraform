output "available_zones_roboshop" {
  value = module.vpc_infra.aws_availability_zones
    }

output "slicing_zones_test" {
  value = module.vpc_infra.slicing_zones
}

output "subnet_id_test" {
  value = module.vpc_infra.database_subnet_id
}

output "default_vpc_details" {
  value = module.vpc_infra.default_id
}

output "default_routetable" {
  value = module.vpc_infra.default_routetable
}

output "roboshop_vpc_cidr" {
  value = module.vpc_infra.roboshop_vpc_cidrblock
}

output "roboshop_vpc_id" {
  value = module.vpc_infra.roboshop_vpc_id
}

# output "roboshop_vpc_ssm_value" {
#   value = aws_ssm_parameter.roboshop_vpc.value
# }

output "default_vpc_id" {
  value = module.vpc_infra.default_id
}