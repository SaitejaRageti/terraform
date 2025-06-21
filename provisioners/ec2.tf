resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.environment == "dev" ? "t3.micro" : "t2.small"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt" 
  }

  provisioner "local-exec" {
    command = "echo 'instances destroyed' > private_ips.txt"
    when = destroy
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }

  tags = {
     Name = var.instances[count.index]
  }
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.description

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
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