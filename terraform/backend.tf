terraform {
  backend "gcs" {
    bucket = "my-terraform-state-bucket-devops"
    prefix = "envs/production"
  }
}
