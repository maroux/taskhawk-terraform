variable "name" {
  description = "Application name (e.g. DEV-MYAPP); unique across your infra"
}

variable "function_arn" {
  description = "Lambda function ARN for the worker app"
}

variable "function_name" {
  description = "Lambda function name for the worker app"
}

variable "function_qualifier" {
  description = "Lambda function qualifier for the worker app, this may be used to trigger functions based on aliases"
  default     = ""
}
