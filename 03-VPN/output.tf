output "default_subnets" {
  value = data.aws_subnet.selected.id
}

output "aws_ami" {
  value = data.aws_ami.centos8.id
}