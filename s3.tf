# aws_s3_bucket.banashris-bucket:
resource "aws_s3_bucket" "banashris-bucket" {
    arn                         = "arn:aws:s3:::banashris-bucket"
    bucket                      = "banashris-bucket"

    lifecycle_rule {
        abort_incomplete_multipart_upload_days = 0
        enabled                                = true
        id                                     = "banashris-rule"
        prefix                                 = "foo"
        tags                                   = {}

        expiration {
            days                         = 10
            expired_object_delete_marker = false
        }
    }

    server_side_encryption_configuration {
        rule {
            bucket_key_enabled = false

            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }
}
