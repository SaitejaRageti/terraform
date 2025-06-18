resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"  #mongodb.rageti.site
  type    = "A"
  ttl     = 300
  records = [aws_instance.roboshop[count.index].private_ip]
}