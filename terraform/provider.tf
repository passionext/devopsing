terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "crucial-weaver-477208-g7"
  region  = "us-central1"
}
