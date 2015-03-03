# Configure the AWS Provider
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}

resource "aws_launch_configuration" "consul" {
    name = "consul-${var.release}"
    image_id = "${lookup(var.ami, var.region)}"
    instance_type = "m3.medium"
    key_name = "${var.key_name}"
    security_groups = ["${aws_security_group.consul.name}"]

    user_data = "CONSUL_PUBLIC=${var.public}\nCONSUL_DC=${var.region}\nCONSUL_SECRET=${var.consul_secret}\nCONSUL_JOIN=${aws_instance.bootstrap.public_dns}\nCONSUL_BOOTSTRAP_EXPECT=$(( 1 + ${var.servers} ))"
}

resource "aws_autoscaling_group" "consul" {
  #availability_zones = [ "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e" ]
  availability_zones = [ "us-west-2a", "us-west-2b", "us-west-2c" ]

  name = "consul-${var.release}"
  max_size = "${var.servers}"
  min_size = "${var.servers}"
  health_check_grace_period = 10
  health_check_type = "EC2"
  desired_capacity = "${var.servers}"
  force_delete = true
  launch_configuration = "${aws_launch_configuration.consul.name}"
}

# Single node necessary for bootstrap and self-discovery
# XXX: Problematic if it fails
resource "aws_instance" "bootstrap" {
  ami = "${lookup(var.ami, var.region)}"
  
  instance_type = "m3.medium"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.consul.name}"]
  
  tags {
        Name = "Consul boostrap node (v/${var.release})"
        Release = "${var.release}"
  }

  user_data = "CONSUL_PUBLIC=${var.public}\nCONSUL_DC=${var.region}\nCONSUL_SECRET=${var.consul_secret}\nCONSUL_BOOTSTRAP_EXPECT=$(( 1 + ${var.servers} ))\n"
}

resource "aws_security_group" "consul" {
  name = "consul-${var.release}"
  description = "Consul internal traffic + maintenance."
  
  // These are for internal traffic
  ingress {
    from_port = 8300
    to_port = 8303
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  // This is for the gossip traffic
  ingress {
    from_port = 8300
    to_port = 8303
    protocol = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // These are for maintenance
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 8500
    to_port = 8500
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route53_record" "discovery" {
   zone_id = "${var.zone_id}"
   name = "${var.region}.${var.domain}"
   type = "A"
   ttl = "30"
   records = ["${aws_instance.bootstrap.public_ip}"]
}
