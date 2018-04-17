resource "aws_cloudwatch_metric_alarm" "high_message_alert_default" {
  alarm_name          = "${title(var.queue)} Taskhawk queue message count too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = "300"                                                       // Seconds
  threshold           = "${var.queue_alarm_high_message_count_threshold}"           // Number of messages
  statistic           = "Average"
  treat_missing_data  = "ignore"

  dimensions {
    QueueName = "TASKHAWK-${var.queue}"
  }

  alarm_description = "Alert if Taskhawk SQS queue too high"
  alarm_actions     = "${var.queue_alarm_high_message_count_actions}"
  ok_actions        = "${var.queue_ok_high_message_count_actions}"
}

resource "aws_cloudwatch_metric_alarm" "dlq_alert_default" {
  alarm_name          = "${title(var.queue)} Taskhawk DLQ is non-empty"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ApproximateNumberOfMessagesVisible"

  evaluation_periods = "1"
  namespace          = "AWS/SQS"
  period             = "60"      // Seconds
  threshold          = "1"       // Number of messages
  statistic          = "Sum"
  treat_missing_data = "ignore"

  dimensions {
    QueueName = "TASKHAWK-${var.queue}-DLQ"
  }

  alarm_description = "Alert if Taskhawk DLQ is non-empty"
  alarm_actions     = "${var.dlq_alarm_high_message_count_actions}"
  ok_actions        = "${var.dlq_ok_high_message_count_actions}"
}

resource "aws_cloudwatch_metric_alarm" "high_message_alert_high_priority" {
  alarm_name          = "${title(var.queue)} Taskhawk high priority queue message count too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ApproximateNumberOfMessagesVisible"

  evaluation_periods = "1"
  namespace          = "AWS/SQS"
  period             = "300"                                                           // Seconds
  threshold          = "${var.queue_alarm_high_priority_high_message_count_threshold}" // Number of messages
  statistic          = "Average"
  treat_missing_data = "ignore"

  dimensions {
    QueueName = "TASKHAWK-${var.queue}-HIGH-PRIORITY"
  }

  alarm_description = "Alert if Taskhawk high priority SQS queue too high"
  alarm_actions     = "${var.queue_alarm_high_message_count_actions}"
  ok_actions        = "${var.queue_ok_high_message_count_actions}"
}

resource "aws_cloudwatch_metric_alarm" "dlq_alert_high_priority" {
  alarm_name          = "${title(var.queue)} Taskhawk high priority DLQ is non-empty"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ApproximateNumberOfMessagesVisible"

  evaluation_periods = "1"
  namespace          = "AWS/SQS"
  period             = "60"      // Seconds
  threshold          = "1"       // Number of messages
  statistic          = "Sum"
  treat_missing_data = "ignore"

  dimensions {
    QueueName = "TASKHAWK-${var.queue}-HIGH-PRIORITY-DLQ"
  }

  alarm_description = "Alert if Taskhawk high priority DLQ is non-empty"
  alarm_actions     = "${var.dlq_alarm_high_message_count_actions}"
  ok_actions        = "${var.dlq_ok_high_message_count_actions}"
}

resource "aws_cloudwatch_metric_alarm" "high_message_alert_low_priority" {
  alarm_name          = "${title(var.queue)} Taskhawk low priority queue message count too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ApproximateNumberOfMessagesVisible"

  evaluation_periods = "1"
  namespace          = "AWS/SQS"
  period             = "300"                                                          // Seconds
  threshold          = "${var.queue_alarm_low_priority_high_message_count_threshold}" // Number of messages
  statistic          = "Average"
  treat_missing_data = "ignore"

  dimensions {
    QueueName = "TASKHAWK-${var.queue}-LOW-PRIORITY"
  }

  alarm_description = "Alert if Taskhawk low priority SQS queue too high"
  alarm_actions     = "${var.queue_alarm_high_message_count_actions}"
  ok_actions        = "${var.queue_ok_high_message_count_actions}"
}

resource "aws_cloudwatch_metric_alarm" "dlq_alert_low_priority" {
  alarm_name          = "${title(var.queue)} Taskhawk low priority DLQ is non-empty"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ApproximateNumberOfMessagesVisible"

  evaluation_periods = "1"
  namespace          = "AWS/SQS"
  period             = "60"      // Seconds
  threshold          = "1"       // Number of messages
  statistic          = "Sum"
  treat_missing_data = "ignore"

  dimensions {
    QueueName = "TASKHAWK-${var.queue}-LOW-PRIORITY-DLQ"
  }

  alarm_description = "Alert if Taskhawk low priority DLQ is non-empty"
  alarm_actions     = "${var.dlq_alarm_high_message_count_actions}"
  ok_actions        = "${var.dlq_ok_high_message_count_actions}"
}

resource "aws_cloudwatch_metric_alarm" "high_message_alert_bulk" {
  alarm_name          = "${title(var.queue)} Taskhawk bulk queue message count too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ApproximateNumberOfMessagesVisible"

  evaluation_periods = "1"
  namespace          = "AWS/SQS"
  period             = "300"                                                  // Seconds
  threshold          = "${var.queue_alarm_bulk_high_message_count_threshold}" // Number of messages
  statistic          = "Average"
  treat_missing_data = "ignore"

  dimensions {
    QueueName = "TASKHAWK-${var.queue}-BULK"
  }

  alarm_description = "Alert if Taskhawk bulk SQS queue too high"
  alarm_actions     = "${var.queue_alarm_high_message_count_actions}"
  ok_actions        = "${var.queue_ok_high_message_count_actions}"
}

resource "aws_cloudwatch_metric_alarm" "dlq_alert_bulk" {
  alarm_name          = "${title(var.queue)} Taskhawk bulk DLQ is non-empty"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "ApproximateNumberOfMessagesVisible"

  evaluation_periods = "1"
  namespace          = "AWS/SQS"
  period             = "60"      // Seconds
  threshold          = "1"       // Number of messages
  statistic          = "Sum"
  treat_missing_data = "ignore"

  dimensions {
    QueueName = "TASKHAWK-${var.queue}-BULK-DLQ"
  }

  alarm_description = "Alert if Taskhawk bulk DLQ is non-empty"
  alarm_actions     = "${var.dlq_alarm_high_message_count_actions}"
  ok_actions        = "${var.dlq_ok_high_message_count_actions}"
}
