variable "ProjectName" {
  type = string
  default = "roboshop"
}

variable "Environment" {
  type = string
  default = "dev"
}

variable "common_tags" {
  type = map
  default = {
    Project = "roboshop"
    Environment = "Development"
  }
}

