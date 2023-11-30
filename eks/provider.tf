terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  backend "s3" {
    bucket         = "terraform-java-app"
    key            = "backend/java_app.tfstate"
    region         = "us-east-2"
    dynamodb_table = "dynamoDB-state-locking"
    skip_credentials_validation = true
  }
}
provider "aws" {
  region     = "us-east-2"
  access_key = "AKIA5VDGASUB4PJFFEXP"
  secret_key = "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"
}


resource "random_string" "suffix" {
  length  = 5
  special = false
}