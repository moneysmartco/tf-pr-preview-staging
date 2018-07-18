# Terraform ALB TargetGroup Preview Staging

[![CircleCI](https://circleci.com/gh/moneysmartco/REPO_NAME.svg?style=svg&circle-token=CIRCLE_CI_TOKEN)](https://circleci.com/gh/moneysmartco/REPO_NAME)


## Testing

This requires `tflint` https://github.com/wata727/tflint

```
make test
```

## What does it do?

Most of our applications are just HTTP endpoint and we need to setup preview staging for them.

Requirements

```
- ALB
- ECS Cluster Name
- DNS wildcard to ALB CNAME
```

Based on the project name and the PR ID, this will create

```
- Target Group "${var.project_name}-${var.pr_id}"
- Listener rule to associate ALB and the new target group with priority number is random between 0-10'000
- ECS service "${var.project_name}-${var.pr_id}"
- ECS task "${var.project_name}-${var.pr_id}"
```