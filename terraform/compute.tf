# -------------------------------
# VM host-alfa in subnet1
# -------------------------------
resource "google_compute_instance" "host_alfa" {
  name         = "host-alfa"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet1.id
  }

  service_account {
    email  = var.gcp_service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

# -------------------------------
# VM host-beta in subnet2
# -------------------------------
resource "google_compute_instance" "host_beta" {
  name         = "host-beta"
  machine_type = "e2-micro"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet2.id
  }

  service_account {
    email  = var.gcp_service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
