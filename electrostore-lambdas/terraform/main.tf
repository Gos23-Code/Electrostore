terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 5.0"        # Use a version of the AWS provider that is compatible with version
    }
  }
}

provider "aws" {
  region   = var.aws_region
 # access_key              = var.aws_access_key     # Solo si estás usando variables
  #secret_key              = var.aws_secret_key     # Solo si estás usando variables
}


resource "aws_dynamodb_table" "user_table" {
  name           = "User"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "uuid"
  range_key      = "email"

  attribute {
    name = "uuid"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }
}