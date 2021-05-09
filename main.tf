resource "random_string" "lambda_name" {
  length = 16
}

locals {
  gateway_name = var.gateway_name == "" ? "${var.app_name}-${random_string.lambda_name.result}" : var.gateway_name
}


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_api_gateway_rest_api" "api_gateway" {
  name        = local.gateway_name
  description = var.description
}


resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE"
}
