# CircleCI to use with AWS-CLI Orb

# Setup
- Add `AWS_DEFAULT_REGION`, `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in context of CircleCI account
- `profile-name: cloudavail` can be any name: set to name of the client
- running `aws s3 ls` tests to list s3 buckets of the AWS account you are deploying to
