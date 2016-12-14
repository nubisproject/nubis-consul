# nubis-consul

[![Version](https://img.shields.io/github/release/nubisproject/nubis-consul.svg?maxAge=2592000)](https://github.com/nubisproject/nubis-consul/releases)
[![Build Status](https://img.shields.io/travis/nubisproject/nubis-consul/master.svg?maxAge=2592000)](https://travis-ci.org/nubisproject/nubis-consul)
[![Issues](https://img.shields.io/github/issues/nubisproject/nubis-consul.svg?maxAge=2592000)](https://github.com/nubisproject/nubis-consul/issues)

## Consul Deployment
The Consul project is designed to be deployed into a standard Nubis Account. It takes advantage of the standard deployment found [here](https://github.com/nubisproject/nubis-docs/blob/master/DEPLOYMENT_OVERVIEW.md). For further specifics about Consul consult the documentation [here](https://www.consul.io/).

### Deployment Diagram
![Deployment Diagram](media/Nubis_Consul_Diagram.png "Deployment Diagram")

**NOTE**: The line colors are representative and are for readability only. They are not intended to indicate any underlying protocol or specific communication details.

### Deployment Notes
The Nubis Consul deployment consists of:
 - Instances deployed on EC2 in an Auto Scaling group
 - An external Elastic Load Balancer (ELB) which has a Security Group which restricts access to a list of IP addresses. The primary function is to allow access to the Continuous Integration (CI) system in the Admin VPC.
 - An internal Elastic Load Balancer (ELB) with a Security Group which restricts access to Nubis Deployed Instances. The function of this ELB is to provide access to instances running within the VPC and ensures a stable endpoint in the event of AutoScaling.
 - A Dynamo DB table which contains startup configuration information. This information is encrypted at rest. The EC2 instances are created with an IAM instance profile which allows access to a KMS key which is used to decrypt the configuration information.
 - A S3 bucket which contains backup data. This bucket is accessible only to Consul EC2 instances via an IAM Policy which is attached at boot via the AutoScaling Launch Configuration.

### Deployment Resources
Details for the deployment including; naming conventions, relationships, permissions, etcetera, can be found in the [Terraform template](nubis/terraform/main.tf) used for deployment. Links to specific resources can be found in the following table.

|Resource Type|Resource Title|Code Location|
|-------------|--------------|-------------|
|aws_launch_configuration|consul|[nubis/terraform/main.tf#8](nubis/terraform/main.tf#8)|
|aws_autoscaling_group|consul|[nubis/terraform/main.tf#36](nubis/terraform/main.tf#36)|
|aws_security_group|consul|[nubis/terraform/main.tf#73](nubis/terraform/main.tf#73)|
|aws_elb|consul|[nubis/terraform/main.tf#130](nubis/terraform/main.tf#130)|
|aws_elb|consul-public|[nubis/terraform/main.tf#169](nubis/terraform/main.tf#169)|
|aws_security_group|elb|[nubis/terraform/main.tf#199](nubis/terraform/main.tf#199)|
|aws_security_group|elb-public|[nubis/terraform/main.tf#228](nubis/terraform/main.tf#228)|
|aws_route53_record|ui|[nubis/terraform/main.tf#250](nubis/terraform/main.tf#250)|
|aws_route53_record|public|[nubis/terraform/main.tf#258](nubis/terraform/main.tf#258)|
|aws_s3_bucket|consul_backups|[nubis/terraform/main.tf#266](nubis/terraform/main.tf#266)|
|aws_iam_instance_profile|consul|[nubis/terraform/main.tf#280](nubis/terraform/main.tf#280)|
|aws_iam_role|consul|[nubis/terraform/main.tf#285](nubis/terraform/main.tf#285)|
|aws_iam_role_policy|consul|[nubis/terraform/main.tf#306](nubis/terraform/main.tf#306)|
|aws_iam_role_policy|consul_backups|[nubis/terraform/main.tf#343](nubis/terraform/main.tf#343)|
|aws_iam_role_policy|credstash|[nubis/terraform/main.tf#372](nubis/terraform/main.tf#372)|
|tls_private_key|consul_web|[nubis/terraform/main.tf#461](nubis/terraform/main.tf#461)|
|tls_self_signed_cert|consul_web_public|[nubis/terraform/main.tf#465](nubis/terraform/main.tf#465)|
|tls_self_signed_cert|consul_web_ui|[nubis/terraform/main.tf#489](nubis/terraform/main.tf#489)|
|aws_iam_server_certificate|consul_web_public|[nubis/terraform/main.tf#519](nubis/terraform/main.tf#519)|
|aws_iam_server_certificate|consul_web_ui|[nubis/terraform/main.tf#530](nubis/terraform/main.tf#530)|
|null_resource|credstash-public|[nubis/terraform/main.tf#546](nubis/terraform/main.tf#546)|
|null_resource|credstash|[nubis/terraform/main.tf#563](nubis/terraform/main.tf#563)|

### Dependencies

You need [credstash](https://github.com/fugue/credstash) locally installed (in your PATH) to be able to deploy Consul

Mozilla Nubis Consul

You need to run

```bash
$> nubis/bin/makecert
```

Before deploying, to generate the SSL key and cert

### Building project
This assumes you are in the project directory

* Build AMI and make note of AMI ID

    ```bash
    nubis-builder build
    ```

* Generate certificate

    ```bash
    cd nubis/terraform
    ../bin/makecert
    ```

* Configure tfvars file

    ```bash
    cd nubis/terraform
    cp terraform.tfvars-dist terraform.tfvars
    <edit tfvar files with appropriate info>
    ```

* Check if terraform plan gives you the right info (for sanity sake)

    ```bash
    cd nubis/terraform
    terraform plan
    ```

* Verify if output looks sane and then deploy

    ```bash
    terraform apply
    ```

* ???
* Profit

### NOTE
