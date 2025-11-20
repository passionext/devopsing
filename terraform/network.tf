# -------------------------------
# VPC NETWORK
# -------------------------------
resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

# CKV2_GCP_18 FIX: Define a firewall rule for the network.
resource "google_compute_firewall" "allow_internal_traffic" {
  name     = "allow-internal-traffic"
  network  = google_compute_network.my_network.name
  priority = 65534

  allow {
    protocol = "all"
  }

  source_ranges = ["10.0.0.0/8"]
}

# -------------------------------
# SUBNET 1
# -------------------------------
resource "google_compute_subnetwork" "subnet1" {
  name                     = "subnet-1"
  ip_cidr_range            = "10.0.1.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.my_network.id
  private_ip_google_access = true
  enable_flow_logs         = true        # Correct attribute for VPC Flow Logs
  log_config {
    aggregation_interval = "INTERVAL_5_MIN"
    flow_sampling       = 0.5
    metadata            = "INCLUDE_ALL_METADATA"
  }
}

# -------------------------------
# SUBNET 2
# -------------------------------
resource "google_compute_subnetwork" "subnet2" {
  name                     = "subnet-2"
  ip_cidr_range            = "10.0.2.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.my_network.id
  private_ip_google_access = true
  enable_flow_logs         = true
  log_config {
    aggregation_interval = "INTERVAL_5_MIN"
    flow_sampling       = 0.5
    metadata            = "INCLUDE_ALL_METADATA"
  }
}
