##################################################################################
# CONFIGURATION (for Terraform > 0.12)
##################################################################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

##################################################################################
# RESOURCES
##################################################################################

#Random ID
resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

# S3 Bucket config#
module "bucket" {
  name = local.s3_bucket_name

  source      = "./modules/s3"
}
