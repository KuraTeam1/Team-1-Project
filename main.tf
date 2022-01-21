terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "${var.region}"
  access_key = "${AWS_ACCESS_KEY_ID.circleci.secret}"
  secret_key = "${AWS_SECRET_ACCESS_KEY.circleci.secret}"
}
