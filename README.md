# VM Deployment Test

A test of Azure VM deployment and configuration

The directory structure is the following:
```
vm-deployment
├── infrastructure
├── ansible
├── azure-pipelines.yml
└── README.md
```

## Requirements:

- `terraform`
- `azure-cli`
- `ansible`
- `ansible-builder` (optional)
- `ansible-navigator` (optional)

## Infrastructure

Terraform IaC to provision and maintain Azure infrastructure.

### Usage

Initialize environment the directory (e.g. test environment):
```sh
cd infrastructure/environments/test/
terraform init
```

Login to your Azure account:
```sh
az login
```

Create a new ssh key:
```sh
ssh-keygen -f ~/.ssh/azure
```

Populate the variables file `terraform.tfvars` with the proper values, then plan the infrastructure:
```sh
terraform plan
```

Apply infrastructure to create the resources:
```sh
terraform apply
```

## Ansible

To access and configure resources use the Ansible playbooks.
Install requirements:
```sh
ansible-galaxy install -r requirements.yml
```

Set the variables in `ansible/group_vars/all.yml` according to your environment and Terraform's initial apply output.

Run the playbook:
```sh
ansible-playbook playbook.yml
```

Alternatively you can use `ansible-builder` to build an execution environment and `ansible-navigator` to run the playbook.


## Azure DevOps Pipeline

Automate the entire process of infrastructure provisioning and resource configuration using CI/CD pipelines in Azure DevOps:

1. Create an organization and project in [Azure DevOps](https://dev.azure.com/)
2. Connect your Git host account (Github in this case) to Azure DevOps using service connections
3. Create an Azure service connection to your subscription and resource group in the Azure DevOps project settings
4. Create a new pipeline using an existing pipeline file, choose the Git repo (or fork) and select `azure-pipelines.yml` for a pipeline file
5. Set these variables for the pipeline:
    - `AZURE_SERVICE_CONNECTION`: the service connection name of your azure resource group
    - `TF_VERSION`: Terraform version to use
    - `TF_DIR`: Terraform environment directory, in this case `infrastructure/environments/test`
    - Run the pipeline
