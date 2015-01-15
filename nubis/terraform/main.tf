# Configure the AWS Provider
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

resource "aws_instance" "bootstrap" {
  ami = "${lookup(var.ami, var.region)}"
  
  instance_type = "m3.medium"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.consul.name}"]
  
  tags {
        Name = "Consul boostrap node"
  }

  user_data = "CONSUL_DC=${var.region}\nCONSUL_TOKEN=${var.token}\nCONSUL_BOOTSTRAP_EXPECT=$(( 1 + ${var.servers} ))\n"
}

resource "aws_instance" "server" {
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "m3.medium"
  key_name = "${var.key_name}"
  count = "${var.servers}"
  security_groups = ["${aws_security_group.consul.name}"]
  
  tags {
        Name = "Consul node"
  }

  user_data = "CONSUL_DC=${var.region}\nCONSUL_TOKEN=${var.token}\nCONSUL_JOIN=${aws_instance.bootstrap.private_dns}\nCONSUL_BOOTSTRAP_EXPECT=$(( 1 + ${var.servers} ))"
}

resource "aws_security_group" "consul" {
  name = "consul"
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

