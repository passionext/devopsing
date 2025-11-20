# Must be defined first! (The VPC network)
resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

# The firewall is also required to pass a previous check (CKV2_GCP_18)
resource "google_compute_firewall" "allow_internal_traffic" {
  name    = "allow-internal-traffic"
  network = google_compute_network.my_network.name
  priority = 65534
  allow {
    protocol = "all"
  }
  source_ranges = ["10.0.0.0/8"]
}

# ... THEN the SUBNET definitions follow ...
resource "google_compute_subnetwork" "subnet1" {
    # ... your config ...
}

resource "google_compute_subnetwork" "subnet2" {
    # ... your config ...
}
