output "vm_private_ips" {
  description = "Private IPs of the two VMs"
  value = {
    hostAlfa = google_compute_instance.host_alfa.network_interface[0].network_ip
    hostBeta = google_compute_instance.host_beta.network_interface[0].network_ip
  }
}

output "bucket_name" {
  description = "Randomized bucket name"
  value       = google_storage_bucket.shared_bucket.name
}
