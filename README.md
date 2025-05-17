# Terraform ToDo List Deployment

A sample Terraform configuration that automates the creation of an Azure infrastructure and deploys a simple ToDo List web application using a Virtual Machine extension.

## Features

* **Resource Group**: Creates an Azure Resource Group.
* **Storage Account & Container**: Stores the startup script and application artifacts.
* **Networking**: Sets up a Virtual Network, Subnet, Network Security Group, and Public IP.
* **Compute**: Provisions an Ubuntu VM and installs the application via the CustomScript extension.
* **Modular**: Organized into `network`, `storage`, and `compute` Terraform modules.

## Prerequisites

* [Terraform](https://www.terraform.io/) v1.x
* [Azure CLI](https://docs.microsoft.com/cli/azure) logged in (`az login`)

## Repository Structure

```
/ (root)
├── modules/
│   ├── network/      # VNet, Subnet, NSG, Public IP
│   ├── storage/      # Storage Account and Container
│   └── compute/      # Network Interface, VM, VM Extension
├── app/              # ToDo application code (flask/Python)
├── install-app.sh    # CustomScript startup script
├── main.tf           # Root Terraform configuration
├── variables.tf      # Input variable definitions
├── terraform.tfvars  # Default variable values
└── README.md         # This file
```

## Usage

1. **Initialize Terraform**

   ```bash
   terraform init
   ```

2. **Review plan**

   ```bash
   terraform plan -out tfplan
   ```

3. **Apply configuration**

   ```bash
   terraform apply tfplan
   ```

4. **Access the ToDo App**

   * Find the VM public IP:

     ```bash
     terraform output -raw public_ip
     ```
   * Open in browser: `http://<PUBLIC_IP>:8080`

## Cleanup

To destroy all resources:

```bash
terraform destroy -var-file="terraform.tfvars" --auto-approve
```
