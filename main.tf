provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_data" {
  bucket = "mi-bucket-data"
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "access_good_1" {
   bucket = aws_s3_bucket.bucket_data.id
   block_public_acls   = true
   block_public_policy = true
 }

resource "aws_security_group" "sg_inseguro" {
  name        = "sg_inseguro"
  description = "Grupo de seguridad"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.1/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
