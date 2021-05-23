output "api_gateway_id" {
  value       = aws_api_gateway_rest_api.rest_api.id
  description = "The ID of the REST API"
}
output "api_gateway_root_resource_id" {
  value       = aws_api_gateway_rest_api.rest_api.root_resource_id
  description = "The resource ID of the REST API's root"
}
output "api_gateway_created_date" {
  value       = aws_api_gateway_rest_api.rest_api.created_date
  description = "The creation date of the REST API"
}
output "api_gateway_execution_arn" {
  value       = aws_api_gateway_rest_api.rest_api.execution_arn
  description = "The execution ARN part to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function, e.g. arn:aws:execute-api:eu-west-2:123456789012:z4675bid1j, which can be concatenated with allowed stage, method and resource path."
}
output "api_gateway_arn" {
  value       = aws_api_gateway_rest_api.rest_api.arn
  description = "Amazon Resource Name (ARN)"
}
output "api_gateway_tags_all" {
  value       = aws_api_gateway_rest_api.rest_api.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}
