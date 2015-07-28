# nubis-consul

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

