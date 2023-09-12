terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "5.15.0"
    }

  }
backend "s3"{
  bucket="mohan14242"
  key="mohankey"
  region="us-east-1"
  dynamodb_table="mohan14242"
}
}

provider "aws" {
    region ="us-east-1"
}