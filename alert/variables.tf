variable "queue" {
  description = "Application queue name (e.g. dev-myapp); unique across your infra"
}

variable "queue_alarm_high_message_count_threshold" {
  description = "Threshold for alerting on high message count in main queue"
  default     = 5000
}

variable "queue_alarm_high_priority_high_message_count_threshold" {
  description = "Threshold for alerting on high message count in high priority queue"
  default     = 5000
}

variable "queue_alarm_low_priority_high_message_count_threshold" {
  description = "Threshold for alerting on high message count in low priority queue"
  default     = 5000
}

variable "queue_alarm_bulk_high_message_count_threshold" {
  description = "Threshold for alerting on high message count in bulk queue"
  default     = 5000
}

variable "queue_alarm_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for main queue Alarm for high message count"
  type        = "list"
}

variable "queue_ok_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for main queue OK for high message count"
  type        = "list"
}

variable "dlq_alarm_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for dead-letter queue Alarm for high message count"
  type        = "list"
}

variable "dlq_ok_high_message_count_actions" {
  description = "Cloudwatch Action ARNs for dead-letter queue OK for high message count"
  type        = "list"
}
