output "address" {
  value = [
    "${aws_instance.bootstrap.public_dns}",
    "${aws_instance.server.0.public_dns}",
    "${aws_instance.server.1.public_dns}",
  ]
}
