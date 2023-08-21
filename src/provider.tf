terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
  }
backend "gcs" {
    bucket  = "my-backend-bucket"
    prefix  = "my-backend"
  }
}

provider "google" {
  project = "engineer-cloud-nprod"
  region  = "us-central1"
  zone    = "us-central1-c"
}