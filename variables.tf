##################################################################################
# VARIABLES
##################################################################################

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
  default = "eu-central-1"
}

variable "bucket_name_prefix" {}

##################################################################################
# LOCALS
##################################################################################

locals {

  env_name = lower(terraform.workspace)
  
  s3_bucket_name = "${var.bucket_name_prefix}-${local.env_name}-${random_integer.rand.result}"

}
