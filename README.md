# Terraform code to create a VPC, Public/Private Subnet along with Security, Routes, IGA, NAT to host Web and DB EC2
## Installation of required AWS packages
- Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
- Configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/configure/)
- Please note, Configuring AWS using `aws configure` CLI command, will write the AWS secret and access key to `~/$USER_HOME/.aws/credentials` file and it will used to authenticate the terraform infra creation in AWS.

##  Install and Configure Terraform
- Refer here [for installing terraform](https://www.terraform.io/downloads.html)
- Extract and Add `terraform` executable path to ENV variables

## Terraform setup in Linux based systems
```
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip -d terraform /usr/local/bin/
```
If terraform executable stored in another path, make sure the path is added in `$PATH` variable permanently.


Terraform setup in Linux based systems
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip -d terraform /usr/local/bin/
If terraform executable stored in another path, make sure the path is added in $PATH variable permanently.

# AWS Infrastructure Automation
We will see How to automate the AWS infrastructure creation using Terraform
As part of the demo code, we will create a Apache webserver and run a sample website
Architecture of this server follows the single tier method, wherein we will create only a simple Webserver for demo purpose

Please note that the terraform.tfvars file does not get backed up but would look something like this: -
```
region          = "us-east-1"
instance_type   = "t2.micro"
main_vpc_cidr   = "10.0.0.0/16"
public_subnets  = "10.0.1.0/24"
private_subnets = "10.0.2.0/24"
creds           = "~/.aws/credentials"
instance_key    = "<insert_aws_pem_key_name>"
```
This Terraform Code Create two AWS EC2, one running Apache WebServer and the other MySQL Database, other infrastructure to support this are listed below:-
- Private Subnet
- Public Subnet
- Private Security Group
- Public Security Group
- Internet Gateway
- Elastic IP
- Nat Gateway
- Route Tables
