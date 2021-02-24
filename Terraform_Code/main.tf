terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAJRGIVTJC5STHVCUA"
  secret_key = "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"
}