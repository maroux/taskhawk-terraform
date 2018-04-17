Task Hawk Scheduler Terraform module
====================================

Terraform module that creates infra for Taskhawk app periodic jobs

Usage
-----
```hcl
module "taskhawk-dev-myapp" {
  source = "git@github.com:Automatic/taskhawk-terraform//queue_app?ref=v1.0"
  queue  = "DEV-MYAPP"
  iam    = true

  tags = {
    app     = "myapp"
    env     = "dev"
  }
}

module "taskhawk-dev-myapp-cron-nightly" {
  source      = "git@github.com:Automatic/taskhawk-terraform//scheduler?ref=v1.0"
  queue       = "${module.taskhawk-dev-myapp.default_queue_arn}"
  name        = "nightly-job"
  description = "nightly job"

  format_version = "v1.0"
  
  headers = {
    request_id = "<id>"
  }
  task    = "tasks.send_email"
  args    = [
    "hello@automatic.com",
    "Hello!"
  ]
  kwargs  = {
    from_email = "spam@example.com"
  }

  schedule_expression = "cron(0 10 * * ? *)"  
}
```

See [cron expressions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions) 
for more details on `schedule_expression`. The timezone is always UTC.

For Lambda apps, use `topic` instead of `queue`.

`version` indicates the message format version for the Taskhawk library.

The following templated variables may be used in `headers`, `args`, and `kwargs`:
`<id>`, `<time>`, `<region>`, `<account>`. More details in [Event Transformer docs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/CloudWatch-Events-Input-Transformer-Tutorial.html).
