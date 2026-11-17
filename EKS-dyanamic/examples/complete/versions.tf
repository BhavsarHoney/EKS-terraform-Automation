terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-tfstate-hani"
    key            = "eks-dynamic/complete/terraform.tfstate"
    region         = "ap-south-1"
    # dynamodb_table = var.backend_dynamodb_table
    encrypt        = true
    use_locking     = true

  }
}
