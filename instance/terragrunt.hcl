remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "doitpay-terraform-state"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-3"
    encrypt        = true
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
      aws = {
      source  = "hashicorp/aws"
      version = ">= 5.16.0, < 5.74.0"
      }
  }
}
provider "aws" {
alias   = "doitpay"
region  = "ap-southeast-3"
profile = "leo"
}
EOF
}

generate "locals" {
  path      = "locals.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
locals {
  doitpay-tags = {
    Terraform    = "true"
    Organization = "doitpay"
    Owner        = "leo"
  }
}
  EOF
}