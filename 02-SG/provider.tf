terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.60.0"
    }
  }
    
  backend "s3" {
    bucket = "nivas-terraformlock"
    key    = "sg-lock"
    region = "us-east-1"
    dynamodb_table = "roboshop-dev-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}