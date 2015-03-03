# nubis-consul release 10

variable "ami" {
  default = {
    us-east-1 = "ami-a63d65ce"
    us-west-2 = "ami-b76e4d87"
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
  default = "consul.nubis.allizom.org"
  description = "Name of the zone used for publication"
}

variable "zone_id" {
  default = "Z991V3TA43J7I"
  description = "ID of the zone used for publication"
}
