provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "sat-s3-eks-backend"

  lifecycle {
    prevent_destroy = false
  }
} 
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_dynamodb_table" "s3_dynamodb_tb" {
  name         = "backend-db"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name  = "LockID"
    type  = "S"
  }
}

