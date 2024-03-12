resource "google_storage_bucket" "function_source" {
  name = "${var.env}-httpFunctions"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}

module "http_functions" {
  source = "./tf-module/http_function"
  for_each = toset([
    "echo"
  ])
  function_name = each.key
  bucket_name = google_storage_bucket.function_source.name
  source_folder = local.function_folder
  temp_folder = "${path.module}/temp"
  environment = var.env
}
