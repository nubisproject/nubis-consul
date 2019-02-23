#Configure the AWS Provider
provider "aws" {
  region  = "${var.aws_region}"
  version = "~> 1"
}

provider "random" {
  version = "~> 1"
}

module "image" {
  source = "github.com/nubisproject/nubis-terraform//images?ref=v2.4.0"

  region        = "${var.aws_region}"
  image_version = "${var.nubis_version}"
  project       = "nubis-consul"
}

resource "aws_sns_topic" "graceful_termination" {
  count = "${var.enabled * length(var.arenas)}"
  name  = "${var.project}-${element(var.arenas, count.index)}-${var.aws_region}-termination"
}

resource "aws_iam_role" "autoscaling_role" {
  count = "${var.enabled * length(var.arenas)}"
  name  = "${var.project}-termination-${element(var.arenas, count.index)}-${var.aws_region}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "autoscaling.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_autoscaling_lifecycle_hook" "graceful_shutdown_asg_hook" {
  count                   = "${var.enabled * length(var.arenas)}"
  name                    = "${var.project}-termination-${element(var.arenas, count.index)}-${var.aws_region}"
  autoscaling_group_name  = "${element(aws_autoscaling_group.consul.*.name, count.index)}"
  default_result          = "CONTINUE"
  heartbeat_timeout       = 60
  lifecycle_transition    = "autoscaling:EC2_INSTANCE_TERMINATING"
  notification_target_arn = "${element(aws_sns_topic.graceful_termination.*.arn, count.index)}"
  role_arn                = "${element(aws_iam_role.autoscaling_role.*.arn, count.index)}"
}

resource "aws_iam_role_policy" "lifecycle_hook_autoscaling_policy" {
  count = "${var.enabled * length(var.arenas)}"
  name  = "${var.project}-termination-${element(var.arenas, count.index)}-${var.aws_region}"
  role  = "${element(aws_iam_role.autoscaling_role.*.id, count.index)}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "sns",
            "Effect": "Allow",
            "Action": [
	        "sns:Publish"
            ],
            "Resource": [
                "${element(aws_sns_topic.graceful_termination.*.arn, count.index)}"
            ]
        }
    ]
}
POLICY
}

resource "aws_launch_configuration" "consul" {
  count = "${var.enabled * length(var.arenas)}"

  depends_on = [
    "null_resource.secrets",
    "null_resource.secrets-public",
  ]

  lifecycle {
    create_before_destroy = true
  }

  name_prefix = "${var.project}-${element(var.arenas, count.index)}-${var.aws_region}-"
  image_id    = "${module.image.image_id}"

  instance_type        = "t2.small"
  key_name             = "${var.key_name}"
  iam_instance_profile = "${element(aws_iam_instance_profile.consul.*.name, count.index)}"
  enable_monitoring    = false

  security_groups = [
    "${element(aws_security_group.consul.*.id, count.index)}",
    "${element(split(",",var.internet_access_security_groups), count.index)}",
    "${element(split(",",var.shared_services_security_groups), count.index)}",
  ]

  user_data = <<EOF
NUBIS_PROJECT=${var.project}
NUBIS_ARENA=${element(var.arenas, count.index)}
NUBIS_ACCOUNT=${var.service_name}
NUBIS_DOMAIN=${var.domain}
CONSUL_ZONE_ID="${element(aws_route53_zone.consul.*.zone_id, count.index)}"
CONSUL_ACL_DEFAULT_POLICY=${var.acl_default_policy}
CONSUL_ACL_DOWN_POLICY=${var.acl_down_policy}
CONSUL_BOOTSTRAP_EXPECT=${var.servers}
CONSUL_BACKUP_BUCKET=${element(aws_s3_bucket.consul_backups.*.id, count.index)}
CONSUL_TERMINATION_TOPIC=${element(aws_sns_topic.graceful_termination.*.id, count.index)}
NUBIS_BUMP=${md5("${var.mig["ca_cert"]}${var.mig["agent_cert"]}${var.mig["agent_key"]}${var.mig["relay_user"]}${var.mig["relay_password"]}${var.instance_mfa["ikey"]}${var.instance_mfa["skey"]}${var.instance_mfa["host"]}${var.instance_mfa["failmode"]}")}
NUBIS_SUDO_GROUPS="${var.nubis_sudo_groups}"
NUBIS_USER_GROUPS="${var.nubis_user_groups}"
EOF
}

resource "aws_autoscaling_group" "consul" {
  count = "${var.enabled * length(var.arenas)}"

  lifecycle {
    create_before_destroy = true
  }

  #XXX: Fugly, assumes 3 subnets per arenas, bad assumption, but valid ATM
  vpc_zone_identifier = [
    "${element(split(",",var.private_subnets), (count.index * 3) + 0 )}",
    "${element(split(",",var.private_subnets), (count.index * 3) + 1 )}",
    "${element(split(",",var.private_subnets), (count.index * 3) + 2 )}",
  ]

  name = "${var.project}-${element(var.arenas, count.index)} (LC ${element(aws_launch_configuration.consul.*.name, count.index)})"

  max_size                  = "${var.servers}"
  min_size                  = "${var.servers}"
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = "${var.servers}"
  force_delete              = true
  launch_configuration      = "${element(aws_launch_configuration.consul.*.name, count.index)}"

  # This resource isn't considered created by TF until we have var.servers in rotation
  #  wait_for_elb_capacity = "${var.servers - 1}"
  wait_for_elb_capacity = "${var.servers}"

  wait_for_capacity_timeout = "60m"

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]

  load_balancers = [
    "${element(aws_elb.consul.*.name, count.index)}",
  ]

  tag {
    key                 = "Name"
    value               = "Consul server node (${var.nubis_version}) for ${var.service_name} in ${element(var.arenas, count.index)}"
    propagate_at_launch = true
  }

  tag {
    key                 = "ServiceName"
    value               = "${var.project}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Arena"
    value               = "${element(var.arenas, count.index)}"
    propagate_at_launch = true
  }

  tag {
    key                 = "ConsulClusterName"
    value               = "consul-server-${element(var.arenas, count.index)}"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "consul" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  name        = "${var.project}-${element(var.arenas, count.index)}"
  description = "Consul internal traffic + maintenance."

  vpc_id = "${element(split(",",var.vpc_ids), count.index)}"

  # XXX: These are for maintenance
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # XXX: Redundant
  # Consul TCP
  ingress {
    self      = true
    from_port = 8300
    to_port   = 8302
    protocol  = "tcp"
  }

  # Consul UDP
  ingress {
    self      = true
    from_port = 8300
    to_port   = 8302
    protocol  = "udp"
  }

  ingress {
    from_port = 8500
    to_port   = 8500
    protocol  = "tcp"

    security_groups = [
      "${element(aws_security_group.elb.*.id, count.index)}",
      "${element(split(",",var.sso_security_groups), count.index)}",
      "${element(split(",",var.shared_services_security_groups), count.index)}",
    ]
  }

  # Put back Amazon Default egress all rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "${var.project}-${element(var.arenas, count.index)}"
    Region = "${var.aws_region}"
    Arena  = "${element(var.arenas, count.index)}"
  }
}

## Create a new load balancer
resource "aws_elb" "consul" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  name = "elb-${var.project}-${element(var.arenas, count.index)}"

  #XXX: Fugly, assumes 3 subnets per arenas, bad assumption, but valid ATM
  subnets = [
    "${element(split(",",var.private_subnets), (count.index * 3) + 0 )}",
    "${element(split(",",var.private_subnets), (count.index * 3) + 1 )}",
    "${element(split(",",var.private_subnets), (count.index * 3) + 2 )}",
  ]

  # This is an internal ELB, only accessible form inside the VPC
  internal = true

  listener {
    instance_port     = 8500
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8500
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${element(aws_iam_server_certificate.consul_web_ui.*.arn, count.index)}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8500/v1/status/peers"
    interval            = 60
  }

  cross_zone_load_balancing = true

  security_groups = [
    "${element(aws_security_group.elb.*.id, count.index)}",
  ]

  tags = {
    Name   = "elb-${var.project}-${element(var.arenas, count.index)}"
    Region = "${var.aws_region}"
    Arena  = "${element(var.arenas, count.index)}"
  }
}

resource "aws_security_group" "elb" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  name        = "elb-${var.project}-${element(var.arenas, count.index)}"
  description = "Allow inbound traffic for consul"

  vpc_id = "${element(split(",",var.vpc_ids), count.index)}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Put back Amazon Default egress all rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "elb-${var.project}-${element(var.arenas, count.index)}"
    Region = "${var.aws_region}"
    Arena  = "${element(var.arenas, count.index)}"
  }
}

resource "aws_route53_zone" "consul" {
  count  = "${var.enabled * length(var.arenas)}"
  name   = "${var.project}.${element(var.arenas, count.index)}.${var.aws_region}.${var.service_name}.${var.domain}"
  vpc_id = "${element(split(",",var.vpc_ids), count.index)}"
}

resource "aws_route53_record" "ui" {
  count   = "${var.enabled * length(var.arenas)}"
  zone_id = "${element(aws_route53_zone.consul.*.zone_id, count.index)}"
  name    = "ui"
  type    = "CNAME"
  ttl     = "30"
  records = ["${element(aws_elb.consul.*.dns_name, count.index)}"]
}

resource "aws_s3_bucket" "consul_backups" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  bucket_prefix = "nubis-${var.project}-backup-${element(var.arenas, count.index)}-"
  acl           = "private"

  # Nuke the bucket content on deletion
  force_destroy = true

  versioning {
    enabled = true
  }

  tags = {
    Name   = "nubis-${var.project}-backup-${element(var.arenas, count.index)}"
    Region = "${var.aws_region}"
    Arena  = "${element(var.arenas, count.index)}"
  }
}

resource "aws_iam_instance_profile" "consul" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  name = "${var.project}-${element(var.arenas, count.index)}-${var.aws_region}"
  role = "${element(aws_iam_role.consul.*.name, count.index)}"
}

resource "aws_iam_role" "consul" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  name = "${var.project}-${element(var.arenas, count.index)}-${var.aws_region}"
  path = "/nubis/consul/"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role_policy" "consul" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  name = "${var.project}-${element(var.arenas, count.index)}-${var.aws_region}"
  role = "${element(aws_iam_role.consul.*.id, count.index)}"

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeTags"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "elasticloadbalancing:DescribeLoadBalancers"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeAutoScalingGroups",
		"autoscaling:DescribeLifecycleHooks"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "autoscaling:CompleteLifecycleAction",
                "autoscaling:RecordLifecycleActionHeartbeat"
            ],
            "Resource": "arn:aws:autoscaling:${var.aws_region}:${data.aws_caller_identity.current.account_id}:autoScalingGroup:*",
            "Effect": "Allow"
        },
	{
            "Action": [
                "route53:ChangeResourceRecordSets"
            ],
            "Resource": "arn:aws:route53:::hostedzone/${element(aws_route53_zone.consul.*.zone_id, count.index)}",
            "Effect": "Allow"
        },
        {
            "Action": [
                "route53:GetChange"
            ],
            "Resource": "arn:aws:route53:::change/*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "route53:ListHostedZonesByName"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },	
        {
            "Action": [
                "sqs:*"
            ],
            "Resource": "arn:aws:sqs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:lifecycled-*",
            "Effect": "Allow"
        },
	{
            "Action": [
                "sns:Subscribe",
                "sns:Unsubscribe"
            ],
            "Resource": "${element(aws_sns_topic.graceful_termination.*.arn, count.index)}",
            "Effect": "Allow"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "consul_backups" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  name = "${var.project}-${element(var.arenas, count.index)}-${var.aws_region}-backups"
  role = "${element(aws_iam_role.consul.*.id, count.index)}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [ "${element(aws_s3_bucket.consul_backups.*.arn,count.index)}" ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": [ "${element(aws_s3_bucket.consul_backups.*.arn,count.index)}/*" ]
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "credstash" {
  count = "${var.enabled * length(var.arenas)}"

  #XXX
  lifecycle {
    create_before_destroy = true
  }

  name = "${var.project}-${element(var.arenas, count.index)}-${var.aws_region}-credstash"
  role = "${element(aws_iam_role.consul.*.id, count.index)}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "kms:GenerateDataKey*",
        "kms:Encrypt"
      ],
      "Resource": [
        "${var.credstash_key}"
      ],
      "Condition": {
        "ForAllValues:StringEquals": {
          "kms:EncryptionContext:arena": "${element(var.arenas, count.index)}",
          "kms:EncryptionContext:service": "nubis",
          "kms:EncryptionContext:region": "${var.aws_region}"
        }
      }
    },
    {
      "Resource": "arn:aws:dynamodb:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/credential-store",
      "Action": [
        "dynamodb:PutItem"
      ],
      "Effect": "Allow",
      "Condition": {
        "ForAllValues:StringLike": {
          "dynamodb:LeadingKeys": [
            "nubis/${element(var.arenas, count.index)}/*"
          ]
        }
      }
    }
  ]
}
EOF
}

resource "tls_private_key" "consul_web" {
  count = "${var.enabled}"

  lifecycle {
    create_before_destroy = true
  }

  algorithm = "RSA"
}

resource "tls_self_signed_cert" "consul_web_ui" {
  count = "${var.enabled * length(var.arenas)}"

  lifecycle {
    create_before_destroy = true
  }

  key_algorithm   = "${tls_private_key.consul_web.algorithm}"
  private_key_pem = "${tls_private_key.consul_web.private_key_pem}"

  # Certificate expires after one year
  validity_period_hours = 8760

  # Generate a new certificate if Terraform is run within three
  # hours of the certificate's expiration time. ( 7 days )
  early_renewal_hours = 168

  is_ca_certificate = true

  # Reasonable set of uses for a server SSL certificate.
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "cert_signing",
  ]

  subject {
    common_name  = "ui.${var.project}.${element(var.arenas, count.index)}.${var.aws_region}.${var.service_name}.${var.domain}"
    organization = "Nubis Platform"
  }
}

resource "aws_iam_server_certificate" "consul_web_ui" {
  count = "${var.enabled * length(var.arenas)}"

  lifecycle {
    create_before_destroy = true
  }

  name_prefix      = "${var.project}-${element(var.arenas, count.index)}-${var.aws_region}-ui-"
  certificate_body = "${element(tls_self_signed_cert.consul_web_ui.*.cert_pem, count.index)}"
  private_key      = "${tls_private_key.consul_web.private_key_pem}"
}

resource "tls_private_key" "gossip" {
  count = "${var.enabled}"

  lifecycle {
    create_before_destroy = true
  }

  algorithm = "RSA"
}

resource "tls_self_signed_cert" "gossip" {
  count = "${var.enabled * length(var.arenas)}"

  lifecycle {
    create_before_destroy = true
  }

  key_algorithm   = "${tls_private_key.gossip.algorithm}"
  private_key_pem = "${tls_private_key.gossip.private_key_pem}"

  # Certificate expires after one year
  validity_period_hours = 8760

  # Generate a new certificate if Terraform is run within three
  # hours of the certificate's expiration time. ( 7 days )
  early_renewal_hours = 168

  is_ca_certificate = true

  # Reasonable set of uses for a server SSL certificate.
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "cert_signing",
    "server_auth",
    "client_auth",
  ]

  subject {
    common_name  = "gossip.${var.project}.${element(var.arenas, count.index)}.${var.aws_region}.${var.service_name}.${var.domain}"
    organization = "Nubis Platform"
  }
}

resource "random_id" "secret" {
  byte_length = 16
}

resource "random_id" "acl_token" {
  byte_length = 32
}

# This null resource is responsible for publishing platform secrets to KMS
resource "null_resource" "secrets-public" {
  count = "${var.enabled * length(var.arenas)}"

  lifecycle {
    create_before_destroy = true
  }

  # Important to list here every variable that affects what needs to be put into KMS
  triggers {
    credstash_key = "${var.credstash_key}"
    cacert        = "${element(tls_self_signed_cert.consul_web_ui.*.cert_pem, count.index)}"
    region        = "${var.aws_region}"
    version       = "${var.nubis_version}"
    context       = "-E region:${var.aws_region} -E arena:${element(var.arenas, count.index)} -E service:nubis"
    unicreds_file = "unicreds -r ${var.aws_region} put-file -k ${var.credstash_key} nubis/${element(var.arenas, count.index)}"
    unicreds_rm   = "unicreds -r ${var.aws_region} delete -k ${var.credstash_key} nubis/${element(var.arenas, count.index)}"
  }

  # Consul Internal UI SSL Certificate
  provisioner "local-exec" {
    command = "echo '${element(tls_self_signed_cert.consul_web_ui.*.cert_pem, count.index)}' | ${self.triggers.unicreds_file}/ssl/cacert /dev/stdin ${self.triggers.context}"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/ssl/cacert"
  }
}

# This null resource is responsible for publishing secrets to KMS
resource "null_resource" "secrets" {
  count = "${var.enabled * length(var.arenas)}"

  lifecycle {
    create_before_destroy = true
  }

  # Important to list here every variable that affects what needs to be put into KMS
  triggers {
    secret                = "${coalesce(var.secret, random_id.secret.b64_std)}"
    master_acl_token      = "${random_id.acl_token.hex}"
    version               = "${var.nubis_version}"
    mig_ca_cert           = "${var.mig["ca_cert"]}"
    mig_agent_cert        = "${var.mig["agent_cert"]}"
    mig_agent_key         = "${var.mig["agent_key"]}"
    mig_relay_user        = "${var.mig["relay_user"]}"
    mig_relay_pass        = "${var.mig["relay_password"]}"
    ssl_key               = "${element(tls_private_key.gossip.*.private_key_pem, count.index)}"
    ssl_cert              = "${element(tls_self_signed_cert.gossip.*.cert_pem, count.index)}"
    region                = "${var.aws_region}"
    context               = "-E region:${var.aws_region} -E arena:${element(var.arenas, count.index)} -E service:${var.project}"
    unicreds_rm           = "unicreds -r ${var.aws_region} delete -k ${var.credstash_key} ${var.project}/${element(var.arenas, count.index)}"
    unicreds              = "unicreds -r ${var.aws_region} put -k ${var.credstash_key} ${var.project}/${element(var.arenas, count.index)}"
    unicreds_file         = "unicreds -r ${var.aws_region} put-file -k ${var.credstash_key} ${var.project}/${element(var.arenas, count.index)}"
    instance_mfa_ikey     = "${var.instance_mfa["ikey"]}"
    instance_mfa_skey     = "${var.instance_mfa["skey"]}"
    instance_mfa_host     = "${var.instance_mfa["host"]}"
    instance_mfa_failmode = "${var.instance_mfa["failmode"]}"
  }

  # Consul gossip secret
  provisioner "local-exec" {
    command = "${self.triggers.unicreds}/secret ${self.triggers.secret} ${self.triggers.context}"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/secret"
  }

  # Consul Master ACL Token
  provisioner "local-exec" {
    command = "${self.triggers.unicreds}/master_acl_token ${random_id.acl_token.hex} ${self.triggers.context}"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/master_acl_token"
  }

  # Consul SSL key
  provisioner "local-exec" {
    command = "echo '${element(tls_private_key.gossip.*.private_key_pem, count.index)}' | ${self.triggers.unicreds_file}/ssl/key /dev/stdin ${self.triggers.context}"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/ssl/key"
  }

  # Consul SSL Certificate
  provisioner "local-exec" {
    command = "echo '${element(tls_self_signed_cert.gossip.*.cert_pem, count.index)}' | ${self.triggers.unicreds_file}/ssl/cert /dev/stdin ${self.triggers.context}"
  }

  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/ssl/cert"
  }

  # MiG

  provisioner "local-exec" {
    command = "${self.triggers.unicreds}/mig/relay/user '${var.mig["relay_user"]}' ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/mig/relay/user"
  }
  provisioner "local-exec" {
    command = "${self.triggers.unicreds}/mig/relay/password '${var.mig["relay_password"]}' ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/mig/relay/password"
  }
  provisioner "local-exec" {
    command = "echo '${file(var.mig["ca_cert"])}' | ${self.triggers.unicreds_file}/mig/ca/cert /dev/stdin ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/mig/ca/cert"
  }
  provisioner "local-exec" {
    command = "echo '${file(var.mig["agent_cert"])}' | ${self.triggers.unicreds_file}/mig/agent/cert /dev/stdin ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/mig/agent/cert"
  }
  provisioner "local-exec" {
    command = "echo '${file(var.mig["agent_key"])}' | ${self.triggers.unicreds_file}/mig/agent/key /dev/stdin ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/mig/agent/key"
  }

  # Instance MFA (DUO)

  provisioner "local-exec" {
    command = "${self.triggers.unicreds}/instance_mfa/ikey '${var.instance_mfa["ikey"]}' ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/instance_mfa/ikey"
  }
  provisioner "local-exec" {
    command = "${self.triggers.unicreds}/instance_mfa/skey '${var.instance_mfa["skey"]}' ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/instance_mfa/skey"
  }
  provisioner "local-exec" {
    command = "${self.triggers.unicreds}/instance_mfa/host '${var.instance_mfa["host"]}' ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/instance_mfa/host"
  }
  provisioner "local-exec" {
    command = "${self.triggers.unicreds}/instance_mfa/failmode '${var.instance_mfa["failmode"]}' ${self.triggers.context}"
  }
  provisioner "local-exec" {
    when    = "destroy"
    command = "${self.triggers.unicreds_rm}/instance_mfa/failmode"
  }
}
