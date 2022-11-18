# Terraform Block
terraform {
#  required_version = "~> 1.3.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# Provider Block
provider "aws" {
  region  = "ap-southeast-2"   # This will make default region as ap-southeast-2
  profile = "default"  # Default profile setup in local. Change it accordingly.
}
