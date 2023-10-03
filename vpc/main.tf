terraform {
  cloud {
    organization = "madinaterraformcloud"

    workspaces {
      name = "infra-vpc"
    }
  }
}