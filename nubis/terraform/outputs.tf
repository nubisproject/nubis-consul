output "address" {
  value = "http://ui.${var.region}.${var.domain}/"
}

output "discovery" {
  value = "${aws_route53_record.discovery.name}/${var.consul_secret}"
}

# Configure the Consul provider
provider "consul" {
    address = "ui.${var.region}.${var.domain}:80"
    datacenter = "${var.region}"
    scheme = "http"
}

resource "consul_keys" "consul" {
  key {
        name = "secret"
        path = "environments/${var.environment}/global/consul/secret"
        value = "${var.consul_secret}"
    }
  key {
        name = "cert"
        path = "environments/${var.environment}/global/consul/cert"
        value = "${file("${var.ssl_cert}")}"
    }
  key {
        name = "key"
        path = "environments/${var.environment}/global/consul/key"
        value = "${file("${var.ssl_key}")}"
    }
}
