output "internal-address" {
  value = "http://${aws_route53_record.ui.fqdn}/"
}
output "public-address" {
  value = "http://${aws_route53_record.public.fqdn}/"
}
