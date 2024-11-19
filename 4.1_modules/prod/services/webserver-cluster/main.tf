provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
    source = "../../../modules/services/webserver-cluster"

    cluster_name = "webservers-prod"
    db_remote_state_bucket = "miyasuta-terraform-up-and-running-state"
    db_remote_state_key = "prod/services/webserver-cluster/terraform.tfstat"
}