terraform {
  required_version = ">= 1.0"
  required_providers {
    oci = {
      version = ">= 4.5"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}
