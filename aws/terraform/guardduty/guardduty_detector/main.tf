provider "aws" {
  region  = "us-west-2"
}

resource "aws_guardduty_detector" "guardduty_detector" {
  enable = true
}
