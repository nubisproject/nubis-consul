#output "consul_endpoints" {
#  value = "${module.consul-admin.elb-address},${module.consul-prod.elb-address},${module.consul-stage.elb-address}"
#}
output "iam_roles" {
  value = "${module.consul.iam_roles}"
}
