provider "aws" {
  region = "us-west-2"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "cloudavail-terraform-test-west"
    key    = "us-west-2/dev/terraform.tfstate"
    region = "us-west-2"
  }
}


#data "terraform_remote_state" "vpc" {
#  backend = "local" 
#
#  config = {
#    path = "${path.module}/terraform.tfstate"
#  }
#}

module "ecs" {
  source              = "../../../modules/ecs"
  environment         = "${var.environment}"
  instance_type       = "${var.instance_type}"
  max_instance        = "${var.max_instance}"
  min_instance        = "${var.min_instance}"
  vpc_id              = "${data.terraform_remote_state.vpc.vpc_id}"
  vpc_zone_identifier = ["${data.terraform_remote_state.vpc.public_subnets}"]
}