provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "random_string" "lambda_name" {
  length  = 16
  special = false
}

locals {
  gateway_name = var.gateway_name == "" ? "${var.app_name}-${random_string.lambda_name.result}" : var.gateway_name
}

resource "aws_api_gateway_rest_api" "rest_api" {
  name               = local.gateway_name
  description        = var.description
  binary_media_types = ["application/octet-stream", "application/x-tar", "application/zip", "audio/basic", "audio/ogg", "audio/mp4", "audio/mpeg", "audio/wav", "audio/webm", "image/png", "image/jpg", "image/jpeg", "image/gif", "video/ogg", "video/mpeg", "video/webm"]
  endpoint_configuration {
    types = ["EDGE"]
  }
}
