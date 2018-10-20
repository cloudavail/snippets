provider "aws" {}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "template_file" "aviatrix_role_app_file" {
  template = "${file("./templates/aviatrix_role_app.json.erb")}"
  vars {
    account_root_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
  }
}

# Aviatrix App Role, Policy and Attachment
resource "aws_iam_role" "aviatrix_role_app" {
  name               = "aviatrix-role-app"
  assume_role_policy = "${data.template_file.aviatrix_role_app_file.rendered}"
}
resource "aws_iam_policy" "aviatrix_app_policy" {
  name   = "aviatrix-app-policy"
  policy = "${file("./files/aviatrix_app_policy.json")}"
}
resource "aws_iam_role_policy_attachment" "aviatrix_role_app_policy_attachment" {
    policy_arn = "${aws_iam_policy.aviatrix_app_policy.arn}"
    role       = "${aws_iam_role.aviatrix_role_app.name}"
}

# Aviatrix EC2 Role, Policy, Attachment and Instance Profile
resource "aws_iam_role" "aviatrix_role_ec2" {
  name               = "aviatrix-role-ec2"
  assume_role_policy = "${file("./files/aviatrix_role_ec2.json")}"
}
resource "aws_iam_policy" "aviatrix_assume_role_policy" {
  name   = "aviatrix-assume-role-policy"
  policy = "${file("./files/aviatrix_assume_role_policy.json")}"
}
resource "aws_iam_role_policy_attachment" "aviatrix_role_ec2_policy_attachment" {
    policy_arn = "${aws_iam_policy.aviatrix_assume_role_policy.arn}"
    role       = "${aws_iam_role.aviatrix_role_ec2.name}"
}
resource "aws_iam_instance_profile" "aviatrix_role_ec2" {
  name = "aviatrix-role-ec2"
  role = "${aws_iam_role.aviatrix_role_ec2.id}"
}

resource "aws_security_group" "aviatrix_controller_security_group" {
  name        = "aviatrix_controller_security_group"
  vpc_id      = "${aws_vpc.vpc.id}"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # would be ideal if egress could be limited to Aviatrix and AWS APIs
  egress {
    # from_port = 0 and to_port = 0 required for protocol = "-1"
    from_port       = 0
    to_port         = 0
    # protocol "-1" allows all protocols of outbound traffic
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "aviatrix_controller_instance" {
  ami                         = "${lookup(var.aviatrix_amis, data.aws_region.current.name)}"
  # associate_public_ip_address = true is suffucient for testing
  # it may be a requirement that your organization not use a public IP
  associate_public_ip_address = true
  disable_api_termination     = true
  iam_instance_profile        = "${aws_iam_instance_profile.aviatrix_role_ec2.role}"
  instance_type               = "t2.micro"
  key_name                    = "aviatrix_controller"
  subnet_id                   = "${aws_subnet.publicsubnet01.id}"
  vpc_security_group_ids      = [
    "${aws_security_group.aviatrix_controller_security_group.id}"
  ]
  tags {
    Name = "AviatrixController"
  }
}

resource "aws_eip" "aviatrix_controller_eip" {
  instance = "${aws_instance.aviatrix_controller_instance.id}"
  vpc      = true
}
