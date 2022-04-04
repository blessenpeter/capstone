# S3 BUCKET MEDIA
resource "aws_s3_bucket" "capstone_s3_meida" {
  bucket = "capstone_s3_meida"
  variable "capstone_media_bucket" {
  type = string
  description = "s3 bucket for capstone media which will store capstone image files"
  default = "capstone_s3_media"
}
}

# S3 BUCKET MEDIA - POLICY
resource "aws_s3_bucket_policy" "capstone_s3_meida_policy" {
  bucket = "${aws_s3_bucket.capstone_s3_meida.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource": [ "${aws_s3_bucket.capstone_s3_meida.arn}/*"]
    }
  ]
}
POLICY
}

# S3 BUCKET CODE
resource "aws_s3_bucket" "capstone_s3_code" {
  bucket = "capstone_s3_code"
  variable "capstone_code_bucket" {
  type = string
  description = "s3 bucket for capstone code which will store backend codes"
  default = "capstone_s3_code"
    }
}

# S3 BUCKET CODE - BLOCK PUBLIC
resource "aws_s3_bucket_public_access_block" "capstone_s3_media_public_block" {
  bucket = aws_s3_bucket.capstone_s3_code.id

  block_public_acls   = true
  block_public_policy = true
}


