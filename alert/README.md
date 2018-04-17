Task Hawk Alerts Terraform module
=================================

Terraform module that creates Cloudwatch alerts for Task Hawk SQS apps

Usage
-----
```hcl
module "alert-dev-myapp" {
  source = "git@github.com:Automatic/taskhawk-terraform//task_hawk_alert?ref=v1.0"
  queue  = "DEV-MYAPP"
}
```
