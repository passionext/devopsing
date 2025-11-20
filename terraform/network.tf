# -------------------------------
# VPC NETWORK
# -------------------------------
resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

# -------------------------------
# SUBNET 1
# -------------------------------
resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.my_network.id
  private_ip_google_access = true
  log_config {
      enable = true
      flow_sampling = 0.5 # Optional: specify a sampling rate
    }
}

# -------------------------------
# SUBNET 2
# -------------------------------
resource "google_compute_subnetwork" "subnet2" {
  name          = "subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.my_network.id
  private_ip_google_access = true
  log_config {
    enable = true
    flow_sampling = 0.5 # Optional: specify a sampling rate
  }
}
