provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    key = "stage/services/webserver-cluster/terraform.tfstate"

    bucket = "miyasuta-terraform-up-and-running-state"
    region = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}

module "webserver_cluster" {
    source = "../../../modules/services/webserver-cluster"

    cluster_name = "webservers-stage"
    db_remote_state_bucket = "miyasuta-terraform-up-and-running-state"
    db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
}