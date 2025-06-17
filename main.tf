provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket_data" {
  bucket = "mi-bucket-data"
  acl    = "private"
}

resource "aws_security_group" "sg_inseguro" {
  name        = "sg_inseguro"
  description = "Grupo de seguridad"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
