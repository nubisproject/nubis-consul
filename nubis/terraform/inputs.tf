# nubis-consul release 10

variable "nubis_version" {
}

variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances."
}

variable "aws_region" {
  default     = "us-east-1"
  description = "The region of AWS, for AMI lookups."
}

variable "servers" {
  default     = "3"
  description = "The number of Consul servers to launch"
}

variable "release" {
  default     = "0"
  description = "Release number of this architecture"
}

variable "build" {
  default     = "35"
  description = "Build number of this architecture"
}

variable "project" {
  default = "consul"
}

variable "arenas" {
  type = "list"
}

variable "domain" {
  description = "Top-level nubis domain for this environment"
  default     = "nubis.allizom.org"
}

variable "service_name" {
  description = "Service this is deployed for (i.e. dpaste)"
}

variable "vpc_ids" {
  description = "IDs of the VPC to launch into"
}

variable "internet_access_security_groups" {
  description = "ID of that SG"
}

variable "shared_services_security_groups" {
  description = "ID of that SG"
}

variable "sso_security_groups" {
  default = ""
}

variable "acl_down_policy" {
  description = "Policy for when ACL master is down"
  default     = "extend-cache"
}

variable "acl_default_policy" {
  description = "Default ACL action for anonymous users"
  default     = "allow"
}

variable "public_subnets" {
  description = "Public Subnets IDs, comma-separated"
}

variable "private_subnets" {
  description = "Private Subnets IDs, comma-separated"
}

variable "allowed_public_cidrs" {
  description = "Comma separated list of CIDRs with public access"
  default     = "127.0.0.1/32"
}

variable "credstash_key" {
  description = "KMS Key ID used for Credstash (aaaabbbb-cccc-dddd-1111-222233334444)"
}

variable "credstash_dynamodb_table" {
}

variable "enabled" {
  default = "1"
}

variable nubis_sudo_groups {
  default = "nubis_global_admins"
}

variable nubis_user_groups {
  default = ""
}

variable mig {
  default = {
    agent_cert     = "mig/agent.crt"
    agent_key      = "mig/agent.key"
    ca             = "mig/ca.crt"
    relay_password = "<unset>"
    relay_user     = "agent-it-nubis"
  }
}

variable instance_mfa {
  default = {
    ikey     = ""
    skey     = ""
    host     = ""
    failmode = "secure"
  }
}
