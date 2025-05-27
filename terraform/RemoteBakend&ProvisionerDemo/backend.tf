terraform {
  backend "s3" {
    bucket         = "demoterraformstatebucket"
    key            = "state_file/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}