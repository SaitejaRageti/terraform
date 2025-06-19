resource "aws_instance" "roboshop" {
  count                  = 4
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? "t3.micro" : "t2.small"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
     Name = var.instances[count.index]
  }
}

resource "aws_security_group" "allow_all"{
  name        = var.sg_name
  description = var.description


  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port = ingress.value["from_port"]
      to_port   = ingress.value["to_port"]
      protocol =var.protocol
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    } 
  }

  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.sg_tags

}