provider "aws" {
  region = "us-west-2"
}

# uncomment if you need to create an IAM role to allow replication
resource "aws_iam_role" "replication" {
  name               = "iam-role-replication"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

# uncomment out if you need to create IAM policy to allow for replication
resource "aws_iam_policy" "replication" {
  name = "iam-role-policy-replication"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.bucket.arn}"
      ]
    },
    {
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectVersionTagging"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.bucket.arn}"
      ]
    },
    {
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],  
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.destination.arn}"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}

# Creates bucket to put replicate data into
resource "aws_s3_bucket" "destination" {
  bucket = "rg-2020-replication-destination"
  region = "us-west-2"

  versioning {
    enabled = true
  }
}

# Creates bucket to add replication rule
resource "aws_s3_bucket" "bucket" {
  bucket = "rg-2020-replication"
  region = "us-west-2"

  versioning {
    enabled = true
  }

  replication_configuration {
    role = aws_iam_role.replication.arn

    rules {
      status = "Enabled"

      destination {
        bucket        = aws_s3_bucket.destination.arn
        storage_class = "STANDARD"
      }
    }
  }
}
