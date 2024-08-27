module "mongodb" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t3.small"
  name = "${local.ec2-name}-mongodb"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_id.value]
  subnet_id              = local.database_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "mongodb"
    },
    {
      Name = "${local.ec2-name}-mongodb"
    }
  )
}

module "redis" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t2.micro"
  name = "${local.ec2-name}-redis"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis_id.value]
  subnet_id              = local.database_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "redis"
    },
    {
      Name = "${local.ec2-name}-redis"
    }
  )
}


module "mysql" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t3.small"
  name = "${local.ec2-name}-mysql"
  vpc_security_group_ids = [data.aws_ssm_parameter.mysql_id.value]
  subnet_id              = local.database_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "mysql"
    },
    {
      Name = "${local.ec2-name}-mysql"
    }
  )
}


module "rabbitmq" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t2.micro"
  name = "${local.ec2-name}-rabbitmq"
  vpc_security_group_ids = [data.aws_ssm_parameter.rabbitmq_id.value]
  subnet_id              = local.database_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "rabbitmq"
    },
    {
      Name = "${local.ec2-name}-rabbitmq"
    }
  )
}

module "catalogue" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t2.micro"
  name = "${local.ec2-name}-redis"
  vpc_security_group_ids = [data.aws_ssm_parameter.catalogue_id.value]
  subnet_id              = local.private_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "catalogue"
    },
    {
      Name = "${local.ec2-name}-catalogue"
    }
  )
}

module "cart" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t2.micro"
  name = "${local.ec2-name}-cart"
  vpc_security_group_ids = [data.aws_ssm_parameter.cart_id.value]
  subnet_id              = local.private_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "cart"
    },
    {
      Name = "${local.ec2-name}-cart"
    }
  )
}

module "user" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t2.micro"
  name = "${local.ec2-name}-user"
  vpc_security_group_ids = [data.aws_ssm_parameter.user_id.value]
  subnet_id              = local.private_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "user"
    },
    {
      Name = "${local.ec2-name}-user"
    }
  )
}

module "shipping" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t3.small"
  name = "${local.ec2-name}-shipping"
  vpc_security_group_ids = [data.aws_ssm_parameter.shipping_id.value]
  subnet_id              = local.private_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "shipping"
    },
    {
      Name = "${local.ec2-name}-shipping"
    }
  )
}

module "payment" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t2.micro"
  name = "${local.ec2-name}-payments"
  vpc_security_group_ids = [data.aws_ssm_parameter.payment_id.value]
  subnet_id              = local.private_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "payment"
    },
    {
      Name = "${local.ec2-name}-payment"
    }
  )
}

module "web" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t2.micro"
  name = "${local.ec2-name}-web"
  vpc_security_group_ids = [data.aws_ssm_parameter.web_id.value]
  subnet_id              = local.public_subnet_id
  tags = merge(
    var.common_tags,
    {
      Component = "web"
    },
    {
      Name = "${local.ec2-name}-web"
    }
  )
}

module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id 
  instance_type          = "t2.micro"
  name = "${local.ec2-name}-ansible"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_id.value]
  subnet_id              = data.aws_subnet.selected.id  #default VPC us-east 1a subnet
  user_data = file("roboshop-provision.sh")
  tags = merge(
    var.common_tags,
    {
      Component = "ansible"
    },
    {
      Name = "${local.ec2-name}-ansible"
    }
  )
}


module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  
  zone_name = var.zone_name

  records = [

    {
      name    = "mongodb"
      type    = "A"
      ttl     = 1
      records = [
        "${module.mongodb.private_ip}",
      ]
    },
    
    {
      name    = "redis"
      type    = "A"
      ttl     = 1
      records = [
        "${module.redis.private_ip}",
      ]
    },
    
    {
      name    = "mysql"
      type    = "A"
      ttl     = 1
      records = [
        "${module.mysql.private_ip}",
      ]
    },
    
    {
      name    = "rabbitmq"
      type    = "A"
      ttl     = 1
      records = [
        "${module.rabbitmq.private_ip}",
      ]
    },
    
    {
      name    = "catalogue"
      type    = "A"
      ttl     = 1
      records = [
        "${module.catalogue.private_ip}",
      ]
    },
    
    {
      name    = "cart"
      type    = "A"
      ttl     = 1
      records = [
        "${module.cart.private_ip}",
      ]
    },
    
    {
      name    = "user"
      type    = "A"
      ttl     = 1
      records = [
        "${module.user.private_ip}",
      ]
    },
    
    {
      name    = "shipping"
      type    = "A"
      ttl     = 1
      records = [
        "${module.shipping.private_ip}",
      ]
    },

    
    {
      name    = "payment"
      type    = "A"
      ttl     = 1
      records = [
        "${module.payment.private_ip}",
      ]
    },
    
    {
      name    = ""
      type    = "A"
      ttl     = 1
      records = [
        "${module.web.private_ip}",
      ]
    },
  ]

}
