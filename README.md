# nubis-consul

[![Version](https://img.shields.io/github/release/nubisproject/nubis-consul.svg?maxAge=2592000)](https://github.com/nubisproject/nubis-consul/releases)
[![Build Status](https://img.shields.io/travis/nubisproject/nubis-consul/master.svg?maxAge=2592000)](https://travis-ci.org/nubisproject/nubis-consul)
[![Issues](https://img.shields.io/github/issues/nubisproject/nubis-consul.svg?maxAge=2592000)](https://github.com/nubisproject/nubis-consul/issues)

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
