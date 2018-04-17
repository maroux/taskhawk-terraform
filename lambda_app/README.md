Task Hawk Lambda App Terraform module
=====================================

Terraform module that creates infra for Task Hawk Lambda app

Usage
-----
```hcl
resource "aws_lambda_function" "dev-myFunction" {
  // ...
}

module "taskhawk-dev-myapp" {
  function           = "${aws_lambda_function.dev-myFunction.arn}"
  function_name      = "${aws_lambda_function.dev-myFunction.function_name}"
  function_qualifier = "deployed"
  name               = "dev-myapp"
}
```

It's recommended that `name` include your environment. 

Naming convention - lower alphanumeric and dashes only.

The SQS topic name will be prefixed by `taskhawk-`.

Lambda Function Config
----------------------

Following things are required in your Lambda function config:

Role policy should include:
```hcl
  statement {
    actions = [
      "SNS:Publish"
    ]
    resources = [
      "arn:aws:sns:us-east-1:686176732873:taskhawk-dev-myapp*"
    ]
  }
```
