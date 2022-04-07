output "api_endpoint" {
  value       = aws_api_gateway_resource.resource.path
  description = "API endpoint path"
}
