terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }

}
provider "aws" {
  region = "us-west-2"
}
