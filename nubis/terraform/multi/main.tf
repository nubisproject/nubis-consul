# environments
provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

module "consul" {
  #source = "github.com/nubisproject/nubis-consul//nubis/terraform?ref=${var.nubis_version}"
  source = "/home/gozer/opt/src/mozilla.org/gozer/nubis/consul/nubis/terraform"

  enabled = "${var.enabled}"

  environments = "${var.environments}"

  aws_profile    = "${var.aws_profile}"
  aws_region     = "${var.aws_region}"
  aws_account_id = "${var.aws_account_id}"

  key_name      = "${var.key_name}"
  nubis_version = "${var.nubis_version}"
  service_name  = "${var.service_name}"

  allowed_public_cidrs = "${var.my_ip}"

  consul_secret            = "${var.consul_secret}"
  master_acl_token         = "${var.consul_master_acl_token}"
  credstash_key            = "${var.credstash_key}"
  credstash_dynamodb_table = "${var.credstash_dynamodb_table}"

  shared_services_security_groups = "${var.shared_services_security_groups}"
  internet_access_security_groups = "${var.internet_access_security_groups}"

  private_subnets = "${var.private_subnet_ids}"
  public_subnets  = "${var.public_subnet_ids}"
  zone_id         = "${var.zone_id}"
  vpc_ids         = "${var.vpc_ids}"

  datadog_api_key = "${var.datadog_api_key}"
}
