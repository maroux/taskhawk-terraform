output "sns_topic_default_arn" {
  value = "${aws_sns_topic.sns_topic_default.arn}"
}

output "sns_topic_high_priority_arn" {
  value = "${aws_sns_topic.sns_topic_high_priority.arn}"
}

output "sns_topic_low_priority_arn" {
  value = "${aws_sns_topic.sns_topic_low_priority.arn}"
}

output "sns_topic_bulk_arn" {
  value = "${aws_sns_topic.sns_topic_bulk.arn}"
}
