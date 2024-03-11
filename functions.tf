resource "google_cloudfunctions_function" "default" {
  name        = "your-function-name"
  description = "A description of your function"
  runtime     = "nodejs20"

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.function_source.name
  source_archive_object = google_storage_bucket_object.function_archive.name

  trigger_http = true
  entry_point  = "httpFunction"

  environment_variables = {
    EXAMPLE_VARIABLE = "example_value"
  }
}

resource "google_storage_bucket" "function_source" {
  name = "your-function-source-bucket"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "function_archive" {
  name   = "your-function.zip"
  bucket = google_storage_bucket.function_source.name
  source = data.archive_file.function.output_path
  depends_on = [data.archive_file.function]
}

data "archive_file" "function" {
  type        = "zip"
  output_path = "temp/function_code.zip"
  source_file = "${path.module}/function/dist/function.js"
}
