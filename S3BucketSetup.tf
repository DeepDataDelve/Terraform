terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.65"
    }
  }
}

resource "aws_s3_bucket" "media-resources" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl

  versioning = {
    enabled = var.versioning
  }
  
    tags = var.tags
}
