# -------------------------------
# RANDOM STRING for bucket suffix
# -------------------------------
resource "random_string" "bucket_id" {
  length  = 6
  upper   = false
  special = false
}

# -------------------------------
# STORAGE BUCKET
# -------------------------------
resource "google_storage_bucket" "shared_bucket" {
  name          = "my-bucket-${random_string.bucket_id.result}"
  location      = "US"
  force_destroy = true
}