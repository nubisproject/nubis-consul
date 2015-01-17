# Configure the AWS Provider
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_launch_configuration" "consul" {
    name = "consul-${var.release}"
    image_id = "${lookup(var.ami, var.region)}"
    instance_type = "m3.medium"
    key_name = "${var.key_name}"
    security_groups = ["${aws_security_group.consul.name}"]

    user_data = "CONSUL_PUBLIC=${var.public}\nCONSUL_DC=${var.region}\nCONSUL_SECRET=${var.secret}\nCONSUL_JOIN=${aws_instance.bootstrap.private_dns}\nCONSUL_BOOTSTRAP_EXPECT=$(( 1 + ${var.servers} ))"
}

resource "aws_autoscaling_group" "consul" {
  availability_zones = ["us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
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
        Name = "Consul boostrap node (${var.release})"
        Release = "${var.release}"
  }

  user_data = "CONSUL_PUBLIC=${var.public}\nCONSUL_DC=${var.region}\nCONSUL_SECRET=${var.secret}\nCONSUL_BOOTSTRAP_EXPECT=$(( 1 + ${var.servers} ))\n"
}

resource "aws_security_group" "consul" {
  name = "consul-${var.release}"
  description = "Consul internal traffic + maintenance."
  
  // These are for internal traffic
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    self = true
  }
  
  // This is for the gossip traffic
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "udp"
    self = true
  }

  // These are for maintenance
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

