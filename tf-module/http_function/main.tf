
resource "google_cloudfunctions_function" "function" {
  name        = "${var.environment}-${var.function_name}"
  runtime     = "nodejs20"

  available_memory_mb   = 256
  source_archive_bucket = var.bucket_name
  source_archive_object = google_storage_bucket_object.function_archive.name

  trigger_http = true
  entry_point  = "httpFunction"

  environment_variables = {
    EXAMPLE_VARIABLE = "example_value"
  }
}

resource "google_storage_bucket_object" "function_archive" {
  name   = "${var.environment}-${var.function_name}.zip"
  bucket = var.bucket_name
  source = data.archive_file.function.output_path
  depends_on = [data.archive_file.function]
}

data "archive_file" "function" {
  type        = "zip"
  output_path = "${var.temp_folder}/${var.function_name}.zip"
  source_content = data.local_file.function_source.content
  source_content_filename = "function.js"
}

data "local_file" "function_source" {
  filename = "${var.source_folder}/${var.function_name}.js"
}
