# note that AWS access keys can be loaded either by:
# an environment variable, set as follows:
# export TF_VAR_aws_access_key=AB7NMAG932M2BV8A
# export TF_VAR_aws_secret_key=B1LOxFmaufi/nn7mnDpf6aba7mDgEB2G8hZ/DDn429
# or by replacing the commented out lines below with access key/secret key values
provider "aws" {

#    access_key = "${env.aws_access_key}"
#    secret_key = "${env.aws_secret_key}"
    region = "us-west-2"
}

resource "aws_security_group" "web" {
  name = "web"
  description = "Allow all inbound traffic"
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
    # using a paravirtual instance type for compatibility with t1.micro
    ami = "ami-ff527ecf"
    # using a t1.micro so we don't require a VPC
    instance_type = "t1.micro"
    # there are two practices for user-data:
    # inline practice: user_data = "#!/bin/bash\nyum -y install httpd\nservice httpd restart"
    # file reference practice: "${file("./path_to_file/filename.sh")}"
    # in example below, I did not investigate how to load a user_data file relative to the
    # terraform file that is referencing the user_data file
    user_data = "${file("./terraform_ec2_user_data/user_data.sh")}"
    security_groups = [ "${aws_security_group.web.name}" ]
    tags {
        Name = "web"
    }
}
