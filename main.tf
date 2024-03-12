terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.19.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.20.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.4.1"
    }
    archive = {
      source = "hashicorp/archive"
      version = "~> 2.4.1"
    }
  }
}

provider "google" {
  project = var.project
  region = var.region
}

provider "google-beta" {
  project = var.project
  region = var.region
}

locals {
  function_folder = "${path.module}/function/dist"
}
