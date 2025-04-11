# EC2 Instance with Terragrunt

This project uses Terragrunt to manage an EC2 instance in AWS.

## Prerequisites

- [Terraform](https://www.terraform.io/) (version 1.9.5)
- [Terragrunt](https://terragrunt.gruntwork.io/) (version 0.67.0)
- AWS credentials configured
- S3 bucket for Terraform state
- DynamoDB table for state locking

## Project Structure

```
ec2/
├── instance/
│   ├── scripts/
│   │   └── user_data.sh           # EC2 instance user data script
│   ├── main.tf                   # Terraform configuration
│   ├── variables.tf              # Terraform variables
│   ├── outputs.tf                # Terraform outputs
│   ├── terragrunt.hcl            # Terragrunt configuration
│   └── .gitignore                # Git ignore file
└── README.md                     # Project documentation
```

## GitHub Actions Workflow

This project includes a GitHub Actions workflow in `.github/workflows/terragrunt-run.yaml` that automates:

1. Planning changes on pull requests to the `f/new-terragrunt-pipeline` branch
2. Applying changes when merged to `master`
3. Supporting manual runs with options to plan, apply, or destroy

## Usage

### Local Development

```bash
# Navigate to the instance directory
cd ec2/instance

# Initialize Terragrunt
terragrunt init

# Plan changes
terragrunt plan

# Apply changes
terragrunt apply

# Destroy resources
terragrunt destroy
```

### CI/CD Pipeline

- Pull requests to `f/new-terragrunt-pipeline` will trigger a plan
- Pushes to `master` will trigger a plan and apply
- Manual workflow runs can be triggered from the GitHub Actions UI

## AWS IAM Role

The GitHub Actions workflow assumes the following IAM role:
`arn:aws:iam::975050366595:role/github-actions-ec2-role`

Ensure this role has the necessary permissions to:
- Read/write to the S3 state bucket
- Read/write to the DynamoDB lock table
- Create/modify/delete the AWS resources defined in this project