output "address" {
  value = "http://${aws_route53_record.ui.fqdn}/"
}
