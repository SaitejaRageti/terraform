variable "ami_id" {
  description = "ami id of the instance"
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "tags_name" {
  type = map(string)
  default = {
    Name = "roboshop"
    purpose = "Variables_demo"
  }
}

variable "sg_name" {
  default = "allow_all"
}

variable "description" {
  type    = string
  default = "allowing all traffic from internet"
}

variable "from_port" {
  type    = number
  default = 0
}
variable "to_port" {
  type    = number
  default = 0
}

variable "protocol" {
  default = "-1"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allow_all"

  }
}

variable "environment" {
  default = "dev"
}

variable "instances" {
    
    default = {
      mongodb = "t2.small"
      frontend = "t3.micro"
      cart = "t3.micro"
      catalogue = "t3.micro"
    }
}

variable "zone_id" {
    type = string
    description = "My hosted zone id"
    default = "Z0536203ZPIYPJY2Y2R6"
}

variable "domain_name" {
    default = "rageti.site"
}
