# -------------------------------
# VM hostAlfa in subnet1
# -------------------------------
resource "google_compute_instance" "host_alfa" {
  name         = "hostAlfa"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet1.id

    # No public IP (no access_config block)
  }

  service_account {
      email  = var.gcp_service_account_email
      scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }
}

# -------------------------------
# VM hostBeta in subnet2
# -------------------------------
resource "google_compute_instance" "host_beta" {
  name         = "hostBeta"
  machine_type = "e2-micro"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet2.id

    # No public IP (no access_config block).
  }

  service_account {
      email  = var.gcp_service_account_email
      scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }
}
