provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "tformstate"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_vpc" "t-demo-vpc" {
  count            = "${terraform.workspace == "dev" ? 1 : 1}"
  cidr_block       = "${var.vpcCidr}"
  instance_tenancy = "default"
  tags = {
    Name        = "${local.vpc_name}"
    Environment = "${terraform.workspace}"
  }
}

# output "vpc_id" {
#   value = "${aws_vpc.t-demo-vpc.id}"
# }
# output "cidr-IP" {
#   value = "${aws_vpc.t-demo-vpc.cidr_block}"
# }
#
# output "ipoid" {
#   value = "${aws_vpc.t-demo-vpc.owner_id}"
# }
