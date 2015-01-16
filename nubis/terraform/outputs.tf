output "address" {
  value = [
    "${aws_instance.bootstrap.public_dns}",
  ]
}
