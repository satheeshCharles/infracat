locals {
  vpc_name = "${terraform.workspace == "dev" ? "dev-vpc" : "prod-vpc"}"
}
