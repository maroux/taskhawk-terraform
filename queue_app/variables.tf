variable "queue" {
  description = "Application queue name (e.g. DEV-MYAPP); unique across your infra"
}

variable "iam" {
  description = "Should IAM policies be generated?"
  default     = false
}

variable "max_receive_count" {
  description = "Maximum number of receives allowed before message is moved to the dead-letter-queue"
  default     = 4
}

variable "tags" {
  description = "Tags to attach to the SQS queues"
  type        = "map"
}
