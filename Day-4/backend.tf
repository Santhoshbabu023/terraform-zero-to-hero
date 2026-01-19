terraform {
  backend "s3" {
    bucket         = "santhosh-s3-create"
    key            = "santhosh/terraform.tfstate"
    region         = "us-east-1"
    # encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}