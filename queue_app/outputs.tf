output "default_queue_arn" {
  value = "${aws_sqs_queue.sqs_queue_default.arn}"
}

output "default_queue_name" {
  value = "${aws_sqs_queue.sqs_queue_default.name}"
}

output "default_dlq_arn" {
  value = "${aws_sqs_queue.dlq_default.arn}"
}

output "default_dlq_name" {
  value = "${aws_sqs_queue.dlq_default.name}"
}

output "high_priority_queue_arn" {
  value = "${aws_sqs_queue.sqs_queue_high_priority.arn}"
}

output "high_priority_queue_name" {
  value = "${aws_sqs_queue.sqs_queue_high_priority.name}"
}

output "high_priority_dlq_arn" {
  value = "${aws_sqs_queue.dlq_high_priority.arn}"
}

output "high_priority_dlq_name" {
  value = "${aws_sqs_queue.dlq_high_priority.name}"
}

output "low_priority_queue_arn" {
  value = "${aws_sqs_queue.sqs_queue_low_priority.arn}"
}

output "low_priority_queue_name" {
  value = "${aws_sqs_queue.sqs_queue_low_priority.name}"
}

output "low_priority_dlq_arn" {
  value = "${aws_sqs_queue.dlq_low_priority.arn}"
}

output "low_priority_dlq_name" {
  value = "${aws_sqs_queue.dlq_low_priority.name}"
}

output "bulk_queue_arn" {
  value = "${aws_sqs_queue.sqs_queue_bulk.arn}"
}

output "bulk_queue_name" {
  value = "${aws_sqs_queue.sqs_queue_bulk.name}"
}

output "bulk_dlq_arn" {
  value = "${aws_sqs_queue.dlq_bulk.arn}"
}

output "bulk_dlq_name" {
  value = "${aws_sqs_queue.dlq_bulk.name}"
}

output "policy_arn" {
  value = "${element(concat(aws_iam_policy.policy.*.arn, list("")), 0)}"
}
