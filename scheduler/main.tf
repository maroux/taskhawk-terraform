resource "aws_cloudwatch_event_rule" "rule" {
  name                = "taskhawk-${var.name}"
  description         = "${var.description}"
  schedule_expression = "${var.schedule_expression}"
}

data "template_file" "input" {
  template = "${file("${path.module}/input.${var.format_version}.tpl")}"

  vars = {
    headers = "${jsonencode(var.headers)}"
    task    = "${var.task}"
    args    = "${jsonencode(var.args)}"
    kwargs  = "${jsonencode(var.kwargs)}"
  }
}

resource "aws_cloudwatch_event_target" "target" {
  rule      = "${aws_cloudwatch_event_rule.rule.name}"
  target_id = "${"taskhawk-target-${var.name}"}"
  arn       = "${var.queue == "" ? var.topic : var.queue}"

  input_transformer = {
    input_paths = {
      "id"      = "$.id"
      "time"    = "$.time"
      "region"  = "$.region"
      "account" = "$.account"
    }

    # since go's default marshal (which is what Terraform uses), escapes <, > for HTML safety,
    # and AWS Cloudwatch template requires use of <id>, decode it back:
    input_template = "${replace(data.template_file.input.rendered, "\"\\u003cid\\u003e\"", "<id>")}"
  }
}
