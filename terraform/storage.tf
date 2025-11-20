# -------------------------------
# RANDOM STRING for bucket suffix
# -------------------------------
resource "random_string" "bucket_id" {
  length  = 6
  upper   = false
  special = false
}

# -------------------------------
# DEDICATED LOG BUCKET
# CKV_GCP_62 requires this separate bucket to store logs from shared_bucket.
# -------------------------------
resource "google_storage_bucket" "access_log_bucket" {
  # checkov:skip=CKV_GCP_62: This bucket is dedicated for collecting logs, so logging itself is not required

  name          = "my-access-logs-${random_string.bucket_id.result}"
  location      = "US"
  force_destroy = true # Use with caution in production

  # Best practice for log buckets: enforce uniform access and public access prevention
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  versioning {
    enabled = true
  }
}

# -------------------------------
# STORAGE BUCKET (Your Main Data Bucket)
# -------------------------------
resource "google_storage_bucket" "shared_bucket" {
  name          = "my-data-bucket-${random_string.bucket_id.result}"
  location      = "US"
  force_destroy = true

  # CKV_GCP_29: Ensure that Cloud Storage buckets have uniform bucket-level access enabled
  uniform_bucket_level_access = true

  # CKV_GCP_114: Ensure public access prevention is enforced
  public_access_prevention = "enforced"

  # CKV_GCP_78: Ensure Cloud storage has versioning enabled
  versioning {
    enabled = true
  }

  # CKV_GCP_62: Bucket should log access
  logging {
    # Reference the name of the dedicated log bucket created above
    log_bucket = google_storage_bucket.access_log_bucket.name
  }
}
