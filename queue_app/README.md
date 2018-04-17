Task Hawk SQS App Terraform module
==================================

Terraform module that creates infra for Task Hawk SQS app

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
```

It's recommended that `queue` include your environment. 

Naming convention - uppercase alphanumeric and dashes only.

The SQS queue name will be prefixed by `TASKHAWK-`.
