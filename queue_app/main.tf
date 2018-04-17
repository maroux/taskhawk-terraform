resource "aws_sqs_queue" "dlq_default" {
  name                      = "TASKHAWK-${var.queue}-DLQ"
  message_retention_seconds = 1209600                     // 14 days - the maximum allowed

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "sqs_queue_default" {
  name                      = "TASKHAWK-${var.queue}"
  delay_seconds             = 0
  message_retention_seconds = 86400                   // one day
  receive_wait_time_seconds = 0

  // add + 0 to max_receive_count for force typecast
  redrive_policy = <<POLICY
{
  "deadLetterTargetArn": "${aws_sqs_queue.dlq_default.arn}",
  "maxReceiveCount": ${var.max_receive_count + 0}
}
POLICY

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_high_priority" {
  name                      = "TASKHAWK-${var.queue}-HIGH-PRIORITY-DLQ"
  message_retention_seconds = 1209600                                   // 14 days - the maximum allowed

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "sqs_queue_high_priority" {
  name                      = "TASKHAWK-${var.queue}-HIGH-PRIORITY"
  delay_seconds             = 0
  message_retention_seconds = 86400                                 // one day
  receive_wait_time_seconds = 0

  // add + 0 to max_receive_count for force typecast
  redrive_policy = <<POLICY
{
  "deadLetterTargetArn": "${aws_sqs_queue.dlq_high_priority.arn}",
  "maxReceiveCount": ${var.max_receive_count + 0}
}
POLICY

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_low_priority" {
  name                      = "TASKHAWK-${var.queue}-LOW-PRIORITY-DLQ"
  message_retention_seconds = 1209600                                  // 14 days - the maximum allowed

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "sqs_queue_low_priority" {
  name                      = "TASKHAWK-${var.queue}-LOW-PRIORITY"
  delay_seconds             = 0
  message_retention_seconds = 86400                                // one day
  receive_wait_time_seconds = 0

  // add + 0 to max_receive_count for force typecast
  redrive_policy = <<POLICY
{
  "deadLetterTargetArn": "${aws_sqs_queue.dlq_high_priority.arn}",
  "maxReceiveCount": ${var.max_receive_count + 0}
}
POLICY

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_bulk" {
  name                      = "TASKHAWK-${var.queue}-BULK-DLQ"
  message_retention_seconds = 1209600                          // 14 days - the maximum allowed

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "sqs_queue_bulk" {
  name                      = "TASKHAWK-${var.queue}-BULK"
  delay_seconds             = 0
  message_retention_seconds = 86400                        // one day
  receive_wait_time_seconds = 0

  // add + 0 to max_receive_count for force typecast
  redrive_policy = <<POLICY
{
  "deadLetterTargetArn": "${aws_sqs_queue.dlq_bulk.arn}",
  "maxReceiveCount": ${var.max_receive_count + 0}
}
POLICY

  tags = "${var.tags}"
}

data "aws_iam_policy_document" "policy_document" {
  "statement" {
    actions = [
      "sqs:*",
    ]

    resources = [
      "arn:aws:sqs:us-east-1:686176732873:TASKHAWK-${var.queue}",
      "arn:aws:sqs:us-east-1:686176732873:TASKHAWK-${var.queue}-DLQ",
      "arn:aws:sqs:us-east-1:686176732873:TASKHAWK-${var.queue}-HIGH-PRIORITY",
      "arn:aws:sqs:us-east-1:686176732873:TASKHAWK-${var.queue}-HIGH-PRIORITY-DLQ",
      "arn:aws:sqs:us-east-1:686176732873:TASKHAWK-${var.queue}-LOW-PRIORITY",
      "arn:aws:sqs:us-east-1:686176732873:TASKHAWK-${var.queue}-LOW-PRIORITY-DLQ",
      "arn:aws:sqs:us-east-1:686176732873:TASKHAWK-${var.queue}-BULK",
      "arn:aws:sqs:us-east-1:686176732873:TASKHAWK-${var.queue}-BULK-DLQ",
    ]
  }
}

resource "aws_iam_policy" "policy" {
  count = "${var.iam == "true" ? 1 : 0}"

  name        = "taskhawk-${var.queue}"
  description = "Taskhawk policy for ${var.queue}"

  policy = "${data.aws_iam_policy_document.policy_document.json}"
}
