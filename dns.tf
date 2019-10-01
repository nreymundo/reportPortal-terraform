resource "aws_route53_record" "external" {
  zone_id = "${var.zone_id}"
  name = "${var.name}"
  type = "CNAME"
  ttl = "300"

  records = ["${aws_eip.instance_eip.public_dns}"]
}