provider "aws" {
  region  = "us-west-2"
}

data "aws_caller_identity" "current" {}

resource "aws_guardduty_detector" "guardduty_detector" {
  enable = true
}

resource "aws_guardduty_organization_admin_account" "guardduty_organization_admin_account" {
  # depends_on = [aws_organizations_organization.guardduty_detector]
  admin_account_id = data.aws_caller_identity.current.account_id
}

resource "aws_guardduty_organization_configuration" "guardduty_organization_configuration" {
  auto_enable = true
  detector_id = aws_guardduty_detector.guardduty_detector.id
}
