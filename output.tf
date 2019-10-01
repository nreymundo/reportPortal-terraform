output "dns_name" {
  value = "${aws_route53_record.external.name}"
}

output "dns_fqdn" {
  value = "${aws_route53_record.external.fqdn}"
}