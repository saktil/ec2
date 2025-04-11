# Configure the AWS provider
provider "aws" {
  region = "ap-southeast-3"
  profile = "leo"
}

# Create the OIDC provider for GitHub Actions
resource "aws_iam_openid_connect_provider" "github_actions" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"  # GitHub's OIDC thumbprint
  ]
  
  tags = {
    Name = "github-actions-oidc-provider"
  }
}

# Create the IAM role for GitHub Actions to assume
resource "aws_iam_role" "github_actions_ec2_role" {
  name = "github-actions-ec2-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
          }
          StringLike = {
            # Update these with your actual repository paths
            "token.actions.githubusercontent.com:sub": [
              "repo:your-organization/ec2:ref:refs/heads/master",
              "repo:your-organization/ec2:ref:refs/heads/*",
              "repo:your-organization/ec2:pull_request"
            ]
          }
        }
      }
    ]
  })
}

# Create a policy that allows managing EC2 resources
resource "aws_iam_policy" "ec2_policy" {
  name        = "github-actions-ec2-policy"
  description = "Policy for managing EC2 instances via GitHub Actions"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:*",
          "elasticloadbalancing:*",
          "logs:*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:*"
        ]
        Resource = [
          "arn:aws:s3:::doitpay-terraform-state",
          "arn:aws:s3:::doitpay-terraform-state/*"
        ]
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "github_actions_ec2_policy_attachment" {
  role       = aws_iam_role.github_actions_ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

# Output the role ARN for reference
output "github_actions_role_arn" {
  value       = aws_iam_role.github_actions_ec2_role.arn
  description = "ARN of the IAM role for GitHub Actions"
}