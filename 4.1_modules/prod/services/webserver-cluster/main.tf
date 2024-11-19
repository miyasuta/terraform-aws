provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    key = "prod/services/webserver-cluster/terraform.tfstate"

    bucket = "miyasuta-terraform-up-and-running-state"
    region = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}


module "webserver_cluster" {
    source = "../../../modules/services/webserver-cluster"

    cluster_name = "webservers-prod"
    db_remote_state_bucket = "miyasuta-terraform-up-and-running-state"
    db_remote_state_key = "prod/services/webserver-cluster/terraform.tfstat"

    instance_type = "t2.micro"
    min_size = 2
    max_size = 10
}