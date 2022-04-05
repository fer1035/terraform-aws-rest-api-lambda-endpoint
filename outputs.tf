output "api_endpoint" {
  value       = "${var.api_url}/${aws_api_gateway_resource.resource.path_part}"
  description = "API endpoint URL."
}
