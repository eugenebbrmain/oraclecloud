variable "instance_availability_domain" {
  type        = string
  default     = "gnhz:EU-FRANKFURT-1-AD-1"
  description = "VM place"
}

variable "instance_shape" {
  type        = string
  default     = "VM.Standard.E2.1.Micro"
  description = "VM size/type"
}

variable "region" {
  type        = string
  default     = "eu-frankfurt-1"
  description = "VM region identifier"
}

variable "tenancy_ocid" {
  type        = string
  description = "Tenancy ID"
}

variable "compartment_ocid" {
  type        = string
  description = "Compartment ID"
}

variable "user_ocid" {
  type        = string
  description = "Local user (not federated identity) ID"
}

variable "fingerprint" {
  type        = string
  description = "Fingerprint of API keys"
}

variable "private_key_path" {
  type        = string
  description = "Path to the private key"
}

variable "ssh_authorized_keys" {
  description = "Public SSH keys path to be included in the ~/.ssh/authorized_keys file for the default user on the instance."
  type        = string
}

variable "user_data" {
  description = "Provide your own base64-encoded data to be used by Cloud-Init to run custom scripts or provide custom Cloud-Init configuration."
  default     = null
  type        = string
}
