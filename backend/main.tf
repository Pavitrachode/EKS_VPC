provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "demo-terraform-eks-state-bucket20"

  lifecycle {
    prevent_destroy = false


  }

}

 
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-eks-state-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"
  

  attribute {
    name = "LockId"
    type = "S"
  }
   
}