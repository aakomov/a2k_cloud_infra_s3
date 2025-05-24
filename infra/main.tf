# IAM ресурсы

resource "yandex_iam_service_account" "sa" {
  name        = var.yc_service_account_name
  description = "Service account for bject storage"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
  folder_id = var.yc_folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "Static access key for object storage"
}

# Storage ресурсы
resource "yandex_storage_bucket" "data_bucket" {
  bucket        = "${var.yc_bucket_name}-${var.yc_folder_id}"
  access_key    = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  force_destroy = true
  anonymous_access_flags {
    read        = true
    list        = true
    config_read = false
  }
}