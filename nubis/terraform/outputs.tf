output "address" {
  value = "http://${aws_route53_record.ui.name}/"
}

output "discovery" {
  value = "${aws_route53_record.discovery.name}/${var.consul_secret}"
}
 
