# Terraform Jenkins AWS

This repository contains Terraform code for provisioning a VPC, subnet, internet gateway, default route, IAM instance profile with S3 access, security group, S3 Bucket, and EC2 instance with user data script installing Jenkins.

## Prerequisites

Before you begin, you'll need:

- An AWS account
- Terraform installed on your local machine
- AWS CLI installed on your local machine

## Usage

1. Clone this repository to your local machine.
2. Modify the variables in `variables.tf` to suit your needs.
3. Run `terraform init` to initialize the working directory.
4. Run `terraform plan` to preview the changes that will be made to your infrastructure.
5. Run `terraform apply` to create the resources.
6. Once the resources have been created, you can access Jenkins by navigating to the public IP address of the EC2 instance in your web browser.
7. When you are finished using the resources, you can destroy them by running `terraform destroy`.

## Troubleshooting

If you encounter any issues with the Terraform code, you can use the following commands to help troubleshoot:

- `terraform fmt` to format the code according to best practices and conventions.
- `terraform validate` to check the syntax and validity of the code.
- `terraform plan` to preview the changes that will be made to the infrastructure.
- `terraform state list` to display a list of all resources in the Terraform state file.
