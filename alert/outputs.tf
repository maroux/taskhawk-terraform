output "high_message_alert_default_id" {
  value = "${aws_cloudwatch_metric_alarm.high_message_alert_default.id}"
}

output "high_message_alert_high_priority_id" {
  value = "${aws_cloudwatch_metric_alarm.high_message_alert_high_priority.id}"
}

output "high_message_alert_low_priority_id" {
  value = "${aws_cloudwatch_metric_alarm.high_message_alert_low_priority.id}"
}

output "dlq_alert_default_id" {
  value = "${aws_cloudwatch_metric_alarm.dlq_alert_default.id}"
}

output "dlq_alert_high_priority_id" {
  value = "${aws_cloudwatch_metric_alarm.dlq_alert_high_priority.id}"
}

output "dlq_alert_low_priority_id" {
  value = "${aws_cloudwatch_metric_alarm.dlq_alert_low_priority.id}"
}
