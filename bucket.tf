provider "google" {
    credentials = "keys.json"
    project = "sturdy-ranger-355706"
  
}
resource "google_compute_network" "vpc_network" {
  name                    = "vpc-networktest-9876"
  auto_create_subnetworks = true
  mtu                     = 1460
}


resource "google_storage_bucket" "auto-expire" {
  name          = "auto-expiring-bucket89786"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}
resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "example_dataset"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = google_service_account.bqowner.email
  }

  access {
    role   = "READER"
    domain = "hashicorp.com"
  }
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}
