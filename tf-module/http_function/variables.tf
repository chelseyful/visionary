variable "function_name" {
    type = string
    description = "Name of function"
}

variable "source_folder" {
    type = string
    description = "directory containing function files"
}

variable "temp_folder" {
    type = string
    description = "Direcory to store zipped functions"
}

variable "bucket_name" {
    type = string
    description = "The name of the storage bucket containing function sources"
}

variable "environment" {
    type = string
    description = "environment prefix used when creating resources"
    default = "dev"
}
