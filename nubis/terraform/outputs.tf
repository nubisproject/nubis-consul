output "address" {
  value = "${aws_instance.bootstrap.public_dns}"
}

output "discovery" {
  value = "${aws_route53_record.discovery.name}/${var.consul_secret}"
}
 
