# S3 BUCKET MEDIA
resource "aws_s3_bucket" "CAPSTONE_S3_MEDIA" {
  bucket = "CAPSTONE_S3_MEDIA"
}

# S3 BUCKET MEDIA - POLICY
resource "aws_s3_bucket_policy" "CAPSTONE_S3_MEDIA_POLICY" {
  bucket = "${aws_s3_bucket.CAPSTONE_S3_MEDIA.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource":  ["arn:aws:s3:::CAPSTONE_S3_MEDIA/*"]
    }
  ]
}
POLICY
}

# S3 BUCKET CODE
resource "aws_s3_bucket" "CAPSTONE_S3_CODE" {
  bucket = "CAPSTONE_S3_CODE"
}

# S3 BUCKET CODE - BLOCK PUBLIC
resource "aws_s3_bucket_public_access_block" "CAPSTONE_S3_MEDIA_PUBLIC_BLOCK" {
  bucket = aws_s3_bucket.CAPSTONE_S3_CODE.id

  block_public_acls   = true
  block_public_policy = true
}


