# nubis-consul release 10

variable "ami" { }

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances."
}

variable "region" {
  default = "us-east-1"
  description = "The region of AWS, for AMI lookups."
}

variable "consul_secret" {
  description = "Security shared secret for consul membership (consul keygen)"
}

variable "servers" {
  default = "2"
  description = "The number of Consul servers to launch minus one (bootstrap node)."
}

variable "release" {
  default = "0"
  description = "Release number of this architecture"
}

variable "build" {
  default = "35"
  description = "Build number of this architecture"
}

variable "project" {
  default = "consul"
}

variable "environment" {
  default = "sandbox"
}

variable "public" {
  default = true
  description = "Should this consul cluster be publicly accesible"
}

variable "domain" {
  description = "Name of the zone used for publication"
}

variable "nubis_domain" {
  description = "Top-level nubis domain for this environment"
  default = "nubis.allizom.org"
}

variable "zone_id" {
  description = "ID of the zone used for publication"
}

variable "vpc_id" {
  description = "ID of the VPC to launch into"
}

variable "ssl_cert" {
  description = "SSL Certificate file"
}

variable "ssl_key" {
  description = "SSL Key file"
}

variable "internet_security_group_id" {
  description = "ID of that SG"
}

variable "shared_services_security_group_id" {
  description = "ID of that SG"
}

