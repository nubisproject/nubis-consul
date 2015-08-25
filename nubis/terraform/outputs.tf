output "address" {
  value = "http://${aws_route53_record.ui.fqdn}/"
}

output "discovery" {
  value = "${aws_route53_record.discovery.fqdn}"
}
