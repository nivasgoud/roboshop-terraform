
module "openvpn" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "vpn"
    sg_description = "SG for VPN"
    vpc_id = data.aws_ssm_parameter.default_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "mongodb" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "mongodb"
    sg_description = "SG for MongoDB"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "catalogue" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "catalogue"
    sg_description = "SG for Catalogue"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "cart" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "cart"
    sg_description = "SG for Cart"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "user" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "user"
    sg_description = "SG for User"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "redis" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "redis"
    sg_description = "SG for redis"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "mysql" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "mysql"
    sg_description = "SG for MYSQL"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "shipping" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "shipping"
    sg_description = "SG for Shipping"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "rabbitmq" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "rabbitmq"
    sg_description = "SG for RabbitMQ"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "payment" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "payment"
    sg_description = "SG for payment"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

module "web" {
    source = "git::https://github.com/nivasgoud/terraform-aws-security-group.git?ref=main"
    sg_name = "web"
    sg_description = "SG for WEB"
    vpc_id = data.aws_ssm_parameter.roboshop_vpc_id.value
    #sg_ingress_rules = var.sg_ingress_rules
    ProjectName = var.ProjectName
    Environment = var.Environment
}

###Ingress rule for OpenVPN Module to accept requests from internet to default vpc openvpn server

resource "aws_security_group_rule" "Internet_vpn" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks = ["0.0.0.0/0"] #ideally your home public IP address, but it frequently changes
  security_group_id = module.openvpn.aws_security_group_id
}

#### Ingress rules for MongoDB to accept the connections from VPN,Catalogue,User services of their security group instances

resource "aws_security_group_rule" "vpn_mongodb" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.mongodb.aws_security_group_id
}

resource "aws_security_group_rule" "catalogue_mongodb" {
  source_security_group_id = module.catalogue.aws_security_group_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.aws_security_group_id
}

resource "aws_security_group_rule" "user_mongodb" {
  source_security_group_id = module.user.aws_security_group_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.aws_security_group_id
}

#### Ingress rules for Redis to accept the connections from VPN,CART,User services of their security group instances

resource "aws_security_group_rule" "vpn_redis" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.redis.aws_security_group_id
}

resource "aws_security_group_rule" "cart_redis" {
  source_security_group_id = module.cart.aws_security_group_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.aws_security_group_id
}

resource "aws_security_group_rule" "user_redis" {
  source_security_group_id = module.user.aws_security_group_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.aws_security_group_id
}

#### Ingress rules for MySQL to accept the connections from VPN,Shipping services of their security group instances

resource "aws_security_group_rule" "vpn_mysql" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.mysql.aws_security_group_id
}

resource "aws_security_group_rule" "shipping_mysql" {
  source_security_group_id = module.shipping.aws_security_group_id
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.mysql.aws_security_group_id
}

#### Ingress rules for RabbitMQ to accept the connections from VPN,payment services of their security group instances

resource "aws_security_group_rule" "vpn_rabbitmq" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.rabbitmq.aws_security_group_id
}

resource "aws_security_group_rule" "payment_rabbitmq" {
  source_security_group_id = module.payment.aws_security_group_id
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  security_group_id = module.rabbitmq.aws_security_group_id
}

#### Ingress rules for Catalogue to accept the connections from VPN,WEB SERVER, CART services of their security group instances

resource "aws_security_group_rule" "vpn_catalogue" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.catalogue.aws_security_group_id
}

resource "aws_security_group_rule" "web_catalogue" {
  source_security_group_id = module.web.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.catalogue.aws_security_group_id
}

resource "aws_security_group_rule" "cart_catalogue" {
  source_security_group_id = module.cart.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.catalogue.aws_security_group_id
}

#### Ingress rules for Cart to accept the connections from VPN,WEB SERVER,Shipping,payment services of their security group instances

resource "aws_security_group_rule" "vpn_cart" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.cart.aws_security_group_id
}

resource "aws_security_group_rule" "web_cart" {
  source_security_group_id = module.web.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.cart.aws_security_group_id
}

resource "aws_security_group_rule" "shipping_cart" {
  source_security_group_id = module.shipping.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.cart.aws_security_group_id
}

resource "aws_security_group_rule" "payment_cart" {
  source_security_group_id = module.payment.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.cart.aws_security_group_id
}

#### Ingress rules for User to accept the connections from VPN,WEB SERVER,payment services of their security group instances

resource "aws_security_group_rule" "vpn_user" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.user.aws_security_group_id
}

resource "aws_security_group_rule" "web_user" {
  source_security_group_id = module.web.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.user.aws_security_group_id
}

resource "aws_security_group_rule" "payment_user" {
  source_security_group_id = module.payment.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.user.aws_security_group_id
}

#### Ingress rules for Shipping to accept the connections from VPN,WEB SERVER services of their security group instances

resource "aws_security_group_rule" "vpn_shipping" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.shipping.aws_security_group_id
}

resource "aws_security_group_rule" "web_shipping" {
  source_security_group_id = module.web.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.shipping.aws_security_group_id
}

#### Ingress rules for payment to accept the connections from VPN,WEB SERVER services of their security group instances

resource "aws_security_group_rule" "vpn_payment" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.payment.aws_security_group_id
}

resource "aws_security_group_rule" "web_payment" {
  source_security_group_id = module.web.aws_security_group_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.payment.aws_security_group_id
}

#### Ingress rules for WebServer to accept the connections from VPN services of their security group instances

resource "aws_security_group_rule" "vpn_web" {
  source_security_group_id = module.openvpn.aws_security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.web.aws_security_group_id
}

#### Ingress rules for WebServer to accept the connections from Internet globally

resource "aws_security_group_rule" "Internet_web" {
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.web.aws_security_group_id
}