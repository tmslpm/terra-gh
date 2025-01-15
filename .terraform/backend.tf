terraform {
  required_version = ">= 1.6.3"
  # partial: "./backend.tf.config" (see "./backend.tf.config.template")
  backend "s3" {
    endpoints = {
      s3 = "" # (partial)
    }
    secret_key                  = "" # (partial)
    access_key                  = "" # (partial)
    bucket                      = "" # (partial)
    key                         = "" # (partial)
    region                      = "" # (partial)
    encrypt                     = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_s3_checksum            = true
  }
}
