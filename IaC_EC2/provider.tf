terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.15.0"
}

provider "aws" {
  region     = "us-east-2"
  access_key = "#{access_key}#"
  secret_key = "#{secret_key}#"
}