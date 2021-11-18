terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.65"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "YOUR IAM USER KEY HERE"
  secret_key = "YOUR SECRET KEY HERE"
}

resource "aws_instance" "twitter-media-search-app_server" {
  ami           = "ami-0e011417bd70948da"
  instance_type = "t4g.micro"

  tags = {
    Name = "AppServer"
  }
}

resource "aws_budgets_budget" "Twitter-Media-Search-Budget" {
  name              = "monthly-budget"
  budget_type       = "COST"
  limit_amount      = "100"
  limit_unit        = "USD"
  time_period_start = "2021-11-17_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["isaacschneider7@gmail.com"]
  }
}