output "id" {
    description = "Unique identified for the function"
    value = google_cloudfunctions_function.function.https_trigger_url
}

output "url" {
    description = "Trigger URL for the function"
    value = google_cloudfunctions_function.function.https_trigger_url
}
