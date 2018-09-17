provider "aws" {
}

resource "aws_iam_user" "test_user" {
  name = "test_user"
}

# if you need an access key
resource "aws_iam_access_key" "test_user_access_key" {
  user = "${aws_iam_user.test_user.name}"
}

resource "aws_iam_user_policy" "test_user_ec2_admin" {
  # name should be assigned to provide an understanding of what this policy does
  name   = "ec2_admin"
  user   = "${aws_iam_user.test_user.name}"
  # the policy below is taken from:
  # https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/AmazonEC2FullAccess
  policy = "${file("./test_user_ec2_admin_policy.json")}"
}

# note that this can be done a number of different ways
# ultimately it seems that all methods actually store the key somewhere
output "secret" {
  value = "${aws_iam_access_key.test_user_access_key.secret}"
}
