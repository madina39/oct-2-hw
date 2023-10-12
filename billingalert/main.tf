terraform {
  cloud {
    organization = "madinaterraformcloud"

    workspaces {
      name = "billing-alert"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "billing_alert" {
  source = "binbashar/cost-billing-alarm/aws"

  aws_env = "AWS-CHARGING-YOU"
  monthly_billing_threshold = 1.00
  currency = "USD"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = module.billing_alert.sns_topic_arns[0]
  protocol  = "email"
  endpoint  = "madinahakimova1999@gmail.com"
}