# -------------------------------
# SERVICE ACCOUNT for both VMs
# -------------------------------
resource "google_service_account" "vm_sa" {
  account_id   = "vm-service-account"
  display_name = "VM Service Account"
}

# -------------------------------
# IAM: allow VM service account to use Storage buckets
# -------------------------------
resource "google_project_iam_member" "bucket_access" {
  project = "crucial-weaver-477208-g7"
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.vm_sa.email}"
}
