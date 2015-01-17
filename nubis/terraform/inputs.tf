# nubis-consul release 10

variable "ami" {
  default = {
    us-east-1 = "ami-4ec8b426"
    us-west-2 = "ami-cda7f8fd"
  }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances."
}

variable "region" {
  default = "us-east-1"
  description = "The region of AWS, for AMI lookups."
}

variable "secret" {
  description = "Security shared secret for consul membership (consul keygen)"
}

variable "servers" {
  default = "2"
  description = "The number of Consul servers to launch minus one (bootstrap node)."
}

variable "release" {
  default = "10"
  description = "Release number of this architecture"
}

variable "public" {
  default = true
  description = "Should this consul cluster be publicly accesible"
}
