variable "yc_token" {
  type        = string
  description = "Yandex Cloud OAuth token"
}

variable "yc_cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "yc_folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "yc_zone" {
  type        = string
  description = "Zone for Yandex Cloud resources"
}

variable "yc_service_account_name" {
  type        = string
  description = "Name of the service account"
  default     = "value"
}

variable "yc_bucket_name" {
  type        = string
  description = "Name of the bucket"
}

variable "public_key_path" {
  type        = string
  description = "Path to the public key file"
}

variable "private_key_path" {
  type        = string
  description = "Path to the private key file"
}