# nubis-consul release 10

variable "ami" {
  default = {
    us-east-1 = "ami-66cf940e"
    us-west-2 = "ami-2beac91b"
  }
}

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
  default = "15"
  description = "Release number of this architecture"
}

variable "public" {
  default = true
  description = "Should this consul cluster be publicly accesible"
}

variable "domain" {
  description = "Name of the zone used for publication"
}

variable "zone_id" {
  description = "ID of the zone used for publication"
}

variable "ssl_cert" {
  description = "SSL Certificate file"
}

variable "ssl_key" {
  description = "SSL Key file"
}
