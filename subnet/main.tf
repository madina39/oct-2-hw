provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    tfe = {
      version = "~> 0.48.0"
    }
  }
  cloud {
    organization = "madinaterraformcloud"

    workspaces {
      name = "infra-subnet"
    }
  }
}
variable "vpc_id" {
  default = "vpc-00a822ef9518646f4"
}

data "aws_vpc" "main" {
  id = var.vpc_id
}

resource "aws_subnet" "main" {
  vpc_id     = data.aws_vpc.main.id
  cidr_block = cidrsubnet(data.aws_vpc.main.cidr_block, 4, 1)

  tags = {
    Name = "Main"
  }
}