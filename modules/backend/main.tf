

resource "aws_s3_bucket" "state_bucket" {
  bucket = "${var.state_name}-terraform-state"
  acl    = "private"

  versioning {
      enabled = true
  }

  tags = {
    Name =  "${var.state_name}-terraform-state"
  }

}

resource "aws_dynamodb_table" "state_locking_table" {
  name           = "${var.state_name}-terraform-dynamodb"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }

# This throws errors if it gets applied twice because of an issue: https://github.com/terraform-providers/terraform-provider-aws/issues/3463
  ttl {
    attribute_name = ""
    enabled        = false
  }


  tags = {
    Name =  "${var.state_name}-terraform-state"
  }
}