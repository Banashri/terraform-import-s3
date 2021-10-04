resource "aws_s3_bucket" "web_bucket" {
  bucket        = var.name
  acl           = "private"
  force_destroy = true

  tags = merge(var.common_tags, { Name = "${var.name}-web-bucket" })
  
}
