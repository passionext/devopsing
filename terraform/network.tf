# -------------------------------
# SUBNET 1 (FIXED LOG CONFIG)
# -------------------------------
resource "google_compute_subnetwork" "subnet1" {
  name                     = "subnet-1"
  ip_cidr_range            = "10.0.1.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.my_network.id
  private_ip_google_access = true

  log_config {
    # The logging parameters must be wrapped in this required block
    flow_logs_config { 
      enable               = true # <-- 'enable' is now supported here
      aggregation_interval = "INTERVAL_5_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }
}

# -------------------------------
# SUBNET 2 (FIXED LOG CONFIG)
# -------------------------------
resource "google_compute_subnetwork" "subnet2" {
  name                     = "subnet-2"
  ip_cidr_range            = "10.0.2.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.my_network.id
  private_ip_google_access = true

  log_config {
    # The logging parameters must be wrapped in this required block
    flow_logs_config {
      enable               = true # <-- 'enable' is now supported here
      aggregation_interval = "INTERVAL_5_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }
}
  }
}
