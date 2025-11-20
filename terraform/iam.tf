data "google_service_account" "vm_sa" {
  project      = "crucial-weaver-477208-g7"
  account_id   = "github-action-test-service-acc"  # only the ID part, not full email
}
