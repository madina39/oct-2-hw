terraform {
  cloud {
    organization = "madinaterraformcloud"

    workspaces {
      name = "infra-ec2"
    }
  }
}
