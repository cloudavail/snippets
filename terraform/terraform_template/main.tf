variable aws_region {
  default = "us-west-2"
}

provider "aws" {
  region = "${var.aws_region}"
}

data "template_file" "example" {
  template = "${file("./templates/user_data.sh")}"
  vars {
    aws_region = "${var.aws_region}"
  }
}

output "rendered" {
  value = "${data.template_file.example.rendered}"
}
