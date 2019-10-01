# ReportPortal Installation with Terraform + Docker

This is just the default installation procedure for ReportPortal with Docker as shown in their documentation with the added Terraform scripts to be able to provision a new AWS EC2 instance at the same time. 

This is a quick install I jury-rigged together sometime in 2018 as a proof-of-concept for work and figured might as well store it here in case anyone finds it useful. 

**DISCLAIMER:** By the time anyone reads this there will likely be an updated ReportPortal version and (more) likely a cleaner way to spin it up in an AWS instance. 

## Software Used: 
- [ReportPortal](https://reportportal.io/) - A test result analysis and aggregation tool. 
- Docker.
- Terraform. 
- Some very dubious bash scripting. 

## How to run it:

1. Make sure the AWS environment variables are correctly set: 
```
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="us-west-2"
```
2. `terraform init`
3. `terraform plan`
4. `terraform apply`