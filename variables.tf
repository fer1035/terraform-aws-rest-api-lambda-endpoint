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

variable "path_part" {
  type        = string
  description = "The path part for the endpoint."
}

variable "parent_id" {
  type        = string
  description = "The parent resource ID of the REST API in API Gateway."
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

variable "api_endpoint_model" {
  type        = string
  description = "A string representation of a JSON object for allowed and required API request parameters. Example: {\"$schema\": \"http://json-schema.org/draft-04/schema#\", \"title\": \"UserModel\", \"type\": \"object\", \"required\": [\"myname\"], \"properties\": {\"myname\": {\"type\": \"string\"}}, \"additionalProperties\": false}"
}

variable "lambda_env_variables" {
  type        = map(any)
  description = "A map for the Lambda function Environment Variables. Example: {ENCODiNG: \"latin-1\", CORS: \"*\"}"
}

variable "lambda_managed_policies" {
  type        = list(any)
  default     = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
  description = "A list of AWS-managed policies to attach to the Lambda function."
}

variable "lambda_inline_policy_actions" {
  type        = list(string)
  default     = ["logs:ListTagsLogGroup"]
  description = "A list of actions for the Lambda function inline policies."
}

variable "lambda_inline_policy_resources" {
  type        = list(string)
  default     = ["arn:aws:logs:::log-group:/aws/lambda/*:*"]
  description = "A list of actions for the Lambda function inline policies."
}

variable "cors" {
  type        = string
  default     = "*"
  description = "API CORS configuration."
}

variable "http_method" {
  type        = string
  default     = "GET"
  description = "Endpoint HTTP method."
}
