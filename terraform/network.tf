# -------------------------------
# VPC NETWORK
# -------------------------------
resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

# CKV2_GCP_18 FIX: Define a firewall rule for the network.
resource "google_compute_firewall" "allow_internal_traffic" {
  name    = "allow-internal-traffic"
  network = google_compute_network.my_network.name
  priority = 65534 # Lower priority than default implicit rules (65535)

  # Rule to allow communication within the network (often required for GKE, etc.)
  allow {
    protocol = "all"
  }

  # This targets all instances in the VPC
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
  log_config {
    enable        = true
    flow_sampling = 0.5
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
  log_config {
    enable        = true
    flow_sampling = 0.5
  }
}
