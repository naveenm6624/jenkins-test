provider "google" {
    credentials = "keys.json"
    project = "sturdy-ranger-355706"
  
}
resource "google_compute_network" "vpc_network" {
  name                    = "vpc-networktest 9876"
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
