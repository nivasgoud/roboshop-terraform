resource "aws_ssm_parameter" "vpn_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/vpn_sg_id"
  type  = "String"
  value = module.openvpn.aws_security_group_id
}

resource "aws_ssm_parameter" "mongodb_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/mongodb_sg_id"
  type  = "String"
  value = module.mongodb.aws_security_group_id
}

resource "aws_ssm_parameter" "catalogue_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/catalogue_sg_id"
  type  = "String"
  value = module.catalogue.aws_security_group_id
}

resource "aws_ssm_parameter" "cart_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/cart_sg_id"
  type  = "String"
  value = module.cart.aws_security_group_id
}

resource "aws_ssm_parameter" "user_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/user_sg_id"
  type  = "String"
  value = module.user.aws_security_group_id
}

resource "aws_ssm_parameter" "redis_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/redis_sg_id"
  type  = "String"
  value = module.redis.aws_security_group_id
}

resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/mysql_sg_id"
  type  = "String"
  value = module.mysql.aws_security_group_id
}

resource "aws_ssm_parameter" "shipping_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/shipping_sg_id"
  type  = "String"
  value = module.shipping.aws_security_group_id
}

resource "aws_ssm_parameter" "rabbitmq_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/rabbitmq_sg_id"
  type  = "String"
  value = module.rabbitmq.aws_security_group_id
}

resource "aws_ssm_parameter" "payment_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/payment_sg_id"
  type  = "String"
  value = module.payment.aws_security_group_id
}

resource "aws_ssm_parameter" "web_sg_id" {
  name  = "/${var.ProjectName}/${var.Environment}/web_sg_id"
  type  = "String"
  value = module.web.aws_security_group_id
}