variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "component" {
  default = "cart"
}

variable "common_tags" {
  default = {
    project = "Roboshop"
    terraform = true
  }
}