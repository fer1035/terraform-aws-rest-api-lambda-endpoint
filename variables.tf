variable "lambda_bucket" {
  type        = string
  default     = "ferdaus-uploads"
  description = "S3 bucket containing the module Lambda source code."
}

variable "lambda_key" {
  type        = string
  default     = "api_function.zip"
  description = "The path to the Lambda ZIP file in the source S3 bucket."
}

variable "lambda_key_sha256" {
  type        = string
  default     = "api_function.zip.sha256.txt"
  description = "The path to the Lambda ZIP file SHA256 hash in the source S3 bucket, generated using: openssl dgst -sha256 -binary api_function.zip | openssl enc -base64 > api_function.zip.sha256.txt"
}

variable "api_root_id" {
  type        = string
  description = "The root resource ID of the REST API in API Gateway."
}

variable "api_name" {
  type        = string
  description = "The name of the REST API."
}

variable "api_description" {
  type        = string
  description = "A description the REST API."
}

variable "api_id" {
  type        = string
  description = "The ID of the REST API in API Gateway."
}

variable "api_validator" {
  type        = string
  description = "The validator ID for the REST API in API Gateway."
}

variable "api_execution_arn" {
  type        = string
  description = "The execution ARN of the REST API in API Gateway."
}

variable "api_url" {
  type        = string
  description = "The invocation URL of the REST API in API Gateway."
}

variable "api_endpoint_model" {
  type        = string
  description = "A string representation of a JSON object for allowed and required API request parameters. Example: {\"$schema\": \"http://json-schema.org/draft-04/schema#\", \"title\": \"UserModel\", \"type\": \"object\", \"required\": [\"myname\"], \"properties\": {\"myname\": {\"type\": \"string\"}}, \"additionalProperties\": false}"
}

variable "lambda_env_variables" {
  type        = map(any)
  description = "A map for the Lambda function Environment Variables. Example: {ENCODiNG: \"latin-1\", CORS: \"*\"}"
}
