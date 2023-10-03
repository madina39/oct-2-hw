
    terraform {
  required_providers {
    tfe = {
      version = "~> 0.49.1"
    }
  }


  cloud {
    organization = "madinaterraformcloud"

    workspaces {
      name = "infra-workspaces"
    }
  }
    }
provider "tfe" {
  version = "~> 0.49.1"

}
data "tfe_organization" "summer-cloud" {
  name = "madinaterraformcloud"
}
locals {
  exec_type = "local"
  infra-components = [
    "vpc",
    "subnet",
    "ec2"
  ]
}

resource "tfe_workspace" "example" {
  for_each = { for component in local.infra-components : component => component }

  name = each.value
  organization = "madinaterraformcloud"
}
