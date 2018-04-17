resource "aws_sns_topic" "sns_topic_default" {
  name = "taskhawk-${var.name}"
}

resource "aws_sns_topic" "sns_topic_high_priority" {
  name = "taskhawk-${var.name}-high-priority"
}

resource "aws_sns_topic" "sns_topic_low_priority" {
  name = "taskhawk-${var.name}-low-priority"
}

resource "aws_sns_topic" "sns_topic_bulk" {
  name = "taskhawk-${var.name}-bulk"
}

resource "aws_sns_topic_subscription" "subscription_default" {
  topic_arn = "${aws_sns_topic.sns_topic_default.arn}"
  protocol  = "lambda"
  endpoint  = "${var.function_arn}"
}

resource "aws_lambda_permission" "allow_sns_default" {
  statement_id  = "AllowExecutionFromSNSDefault"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  qualifier     = "${var.function_qualifier}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${aws_sns_topic.sns_topic_default.arn}"
}

resource "aws_sns_topic_subscription" "subscription_high_priority" {
  topic_arn = "${aws_sns_topic.sns_topic_high_priority.arn}"
  protocol  = "lambda"
  endpoint  = "${var.function_arn}"
}

resource "aws_lambda_permission" "allow_sns_high_priority" {
  statement_id  = "AllowExecutionFromSNSHighPriority"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  qualifier     = "${var.function_qualifier}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${aws_sns_topic.sns_topic_high_priority.arn}"
}

resource "aws_sns_topic_subscription" "subscription_low_priority" {
  topic_arn = "${aws_sns_topic.sns_topic_low_priority.arn}"
  protocol  = "lambda"
  endpoint  = "${var.function_arn}"
}

resource "aws_lambda_permission" "allow_sns_low_priority" {
  statement_id  = "AllowExecutionFromSNSLowPriority"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  qualifier     = "${var.function_qualifier}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${aws_sns_topic.sns_topic_low_priority.arn}"
}

resource "aws_sns_topic_subscription" "subscription_bulk" {
  topic_arn = "${aws_sns_topic.sns_topic_bulk.arn}"
  protocol  = "lambda"
  endpoint  = "${var.function_arn}"
}

resource "aws_lambda_permission" "allow_sns_bulk" {
  statement_id  = "AllowExecutionFromSNSBulk"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name}"
  qualifier     = "${var.function_qualifier}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${aws_sns_topic.sns_topic_bulk.arn}"
}
