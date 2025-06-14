resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = local.sg_id

tags = var.tags_name
}

resource "aws_security_group" "allow_all" {
    name = var.sg_name
    description = var.description

    ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.sg_tags

}