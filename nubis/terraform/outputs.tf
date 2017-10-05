output "iam_roles" {
  value = "${join(",",aws_iam_role.consul.*.id)}"
}

output "master_acl_token" {
  value = "${random_id.acl_token.hex}"
}
